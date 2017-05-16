/*
 * Copyright 2014-2015 Brady Wood, Branko Juric
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package gwen.web

import org.mockito.Mockito.verify
import org.openqa.selenium.WebDriver
import org.scalatest.FlatSpec
import org.scalatest.Matchers
import org.scalatest.mockito.MockitoSugar
import gwen.eval.ScopedDataStack
import gwen.eval.GwenOptions
import org.openqa.selenium.WebDriver.{Options, Timeouts}
import com.isomorphic.webdriver.SmartClientWebDriver

class WebEnvContextTest extends FlatSpec with Matchers with MockitoSugar {
  
  val mockWebDriverOptions: Options = mock[WebDriver.Options]
  val mockWebDriverTimeouts: Timeouts = mock[WebDriver.Timeouts]
  
  "New web env context" should "have 'feature' scope" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.scopes.current.isFeatureScope should be (true)
  }
  
  "Bound scope attribute" should "be recreated after reset" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.scopes.addScope("login")
    env.scopes.set("username", "Gwen")
    env.scopes.get("username") should be ("Gwen")
    env.reset()
    env.scopes.current.isFeatureScope should be (true)
    env.scopes.getOpt("username") should be (None)
  }
  
  "json on new env context" should "be empty" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.scopes.json.toString should be ("""{"scopes":[]}""")
  }
  
  "Bound scope attribute" should "show up in JSON string" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.scopes.addScope("login")
    env.scopes.set("username", "Gwen")
    env.scopes.get("username") should be ("Gwen")
    env.scopes.json.toString should be ("""{"scopes":[{"scope":"login","atts":[{"username":"Gwen"}]}]}""")
                                      
  }
  
  "Resetting new web env context after referencing webdriver" should "quit the browser" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.withWebDriver { webDriver => webDriver }
    env.reset()
    verify(mockDriverManager).quit()
  }
  
  "Attempt to locate unbound element "should "throw locator binding not found error" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    shouldFailWithLocatorBindingError("username", env, "Could not locate username: locator binding not found: username/locator")
  }
  
  "Attempt to locate element with unbound locator" should "throw locator not found error" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.scopes.addScope("login").set("username/locator", "id")
    shouldFailWithLocatorBindingError("username", env, "Could not locate username: locator lookup binding not found: username/locator/id")
  }
  
  "Attribute with text binding" should "be resolved" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.scopes.set("username/text", "Gwen")
    env.getAttribute("username") should be ("Gwen")
  }
  
  "Attribute with javascript binding" should "resolve" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager, dry = true)
    env.scopes.set("username/javascript", "$('#username').val()")
    env.getAttribute("username") should be ("$[javascript:$('#username').val()]")
  }
  
  "Attribute with xpath binding" should "resolve" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.scopes.set("xml", "<users><user>Gwen</user><user>Stacey</user></users>")
    env.scopes.set("username/xpath/source", "xml")
    env.scopes.set("username/xpath/targetType", "text")
    env.scopes.set("username/xpath/expression", "users/user")
    env.getAttribute("username") should be ("Gwen")
    env.scopes.set("username/xpath/expression", "users/user[2]")
    env.getAttribute("username") should be ("Stacey")
  }
  
  "Attribute with regex binding" should "resolve" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.scopes.set("url", "http://www.domain.com?param1=one&param2=two")
    env.scopes.set("param1/regex/source", "url")
    env.scopes.set("param1/regex/expression", "param1=(.+)&")
    env.getAttribute("param1") should be ("one")
    env.scopes.set("param2/regex/source", "url")
    env.scopes.set("param2/regex/expression", "param2=(.+)")
    env.getAttribute("param2") should be ("two")
  }
  
  "Attribute with json path binding" should "resolve" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.scopes.set("env", """{"scopes":[{"scope":"login","atts":[{"username":"Gwen"}]}]}""")
    env.scopes.set("username/json path/source", "env")
    env.scopes.set("username/json path/expression", "$.scopes[0].atts[0].username")
    env.getAttribute("username") should be ("Gwen")
  }
  
  "Attribute with sysproc binding" should "resolve" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager, dry = true)
    env.scopes.set("hostname/sysproc", "local command")
    env.getAttribute("hostname") should be ("$[sysproc:local command]")
  }
  
  "Attribute with file binding" should "resolve" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager, dry = true)
    env.scopes.set("xml/file", "path-to/file.xml")
    env.getAttribute("xml") should be ("$[file:path-to/file.xml]")
  }
  
  "Attribute with sql binding" should "resolve" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager, dry = true)
    env.scopes.set("username/sql/selectStmt", "select username from users")
    env.scopes.set("username/sql/dbName", "subscribers")
    env.getAttribute("username") should be ("$[sql:select username from users]")
  }

  "Valid compare" should "evaluate successfully" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.compare("a", "2", () => "2", "be", negate = false)
  }

  "Valid negated compare" should "evaluate successfully" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.compare("a", "2", () => "1", "be", negate = true)
  }

  "Timeout on compare" should "result in assertion error" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    intercept[AssertionError] {
      env.compare("a", "2", () => "1", "be", negate = false)
    }
  }

  "Timeout on negated compare" should "result in assertion error" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    intercept[AssertionError] {
      env.compare("a", "2", () => "2", "be", negate = true)
    }
  }

  "Resetting web env context" should "reset tracking variables" in {
    val mockDriverManager = mock[DriverManager]
    val env = newEnv(mockDriverManager)
    env.withWebDriver { webDriver => webDriver }
    env.session = "child"
    env.windows.push("childWindow")
    env.lastScreenshotSize = Some(8192)
    env.reset()
    env.session should be ("primary")
    env.windows.isEmpty should be (true)
    env.lastScreenshotSize should be (None)
  }
  
  def newEnv(browser: DriverManager, dry:Boolean = false): WebEnvContext = {
    
   new WebEnvContext(GwenOptions(dryRun=dry), new ScopedDataStack()) {
     override def withWebDriver[T](f: SmartClientWebDriver => T)(implicit takeScreenShot: Boolean = false): T = f(mock[SmartClientWebDriver])
     override def close() { browser.quit() }
   }
  }
  
  private def shouldFailWithLocatorBindingError(element: String, env: WebEnvContext, expectedMsg: String) {
    val e = intercept[LocatorBindingException] {
      env.getLocatorBinding(element)
    }
    e.getMessage should be (expectedMsg)
  }
  
}