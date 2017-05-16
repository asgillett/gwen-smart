[![Gwen-web](https://github.com/gwen-interpreter/gwen/wiki/img/gwen-attractor.png)](https://github.com/gwen-interpreter/gwen/wiki/The-Gwen-Logo)
Gwen-web
========

Gwen-Smart is a fork of the Gwen-Web project specifically for web applications built with the SmartClient and Smart GWT frameworks.
Gwen-Web is a web automation engine that runs inside the [Gwen](https://github.com/gwen-interpreter/gwen) interpreter.
It allows teams to automate front end web tests by writing 
[Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) feature specifications instead of code.
A [prescribed DSL](http://htmlpreview.github.io/?https://github.com/gwen-interpreter/gwen-web/blob/master/docs/dsl/gwen-web-dsl.html) delegates to [Selenium WebDriver](http://www.seleniumhq.org/projects/webdriver) under the covers for you and frees you from development concerns. You can also declaratively compose your own custom DSL with annotated 
[@StepDef](https://github.com/gwen-interpreter/gwen/wiki/Meta-Features#compostable-steps) Scenarios that can accept parameters and call other steps. [Meta features](https://github.com/gwen-interpreter/gwen/wiki/Meta-Features) can help eliminate redundancies and give you the flexibility to be as imperative or as declarative as you like in your approach to writing features.

SmartClient and Smart GWT are trademarks or registered trademarks of Isomorphic Software, Inc.

- See also:
  - [Wiki](https://github.com/gwen-interpreter/gwen-web/wiki)
  - [FAQ](https://github.com/gwen-interpreter/gwen-web/wiki/FAQ)
  - [Blog](https://gweninterpreter.wordpress.com)
  - [Isomorphic Software](http://www.isomorphic.com)

### Why this fork?
SmartClient is an extremely rich web framework developed by Isomorphic Software.  It greatly simplifies building desktop-like applications that run in a browser.

Automated testing of a SmartClient application with standard tools such as Selenium WebDriver presents challenges because the DOM in a SmartClient application is
not only very complex but is also likely to be different on different browsers. To address this problem, the SmartClient authors developed their own WebDriver libraries
that are distributed with SmartClient.

The SmartClient WebDriver differs from the Selenium WebDriver in a number of significant respects:

* A new locator syntax (ByScLocator) is provided in addition to the standard Selenium locators (ById, ByXPath etc.).
* Rather than using the WebDriver to locate WebElements and then manipulating those WebElements, the SmartClientWebDriver provides a rich set of methods for
  directly manipulating the elements in the page.  Each of these methods takes a "By" object and internally locates and manipulates the WebElement without the
  user needing to obtain a reference to that WebElement.
* Additional operations are provided, for example "contextClick", "doubleClick", "dragAndDrop", "waitForElementClickable" and "waitForGridDone".
* Although the SmartClientWebDriver implements the WebDriver interface, most of the methods from that interface are not included in the SmartClient documentation.
  I have assumed that WebDriver methods that are not documented in the SmartClient API should not be used.

Since the SmartClientWebDriver operates in a fundamentally different way to the standard Selenium WebDriver, it was necessary to modify the gwen-web source
and extend the DSL.

### Current Status

[![Build Status](https://travis-ci.org/gwen-interpreter/gwen-web.svg?branch=master)](https://travis-ci.org/gwen-interpreter/gwen-web)

- Not ready for release.
- [Change log](CHANGELOG)

Key Features
------------

* Tests are plain text [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) specifications
  * See [Gwen-Web DSL](http://htmlpreview.github.io/?https://github.com/gwen-interpreter/gwen-web/blob/master/docs/dsl/gwen-web-dsl.html)
* Tests can be run in [batch mode](https://github.com/gwen-interpreter/gwen/wiki/Execution-Modes#batch-execution) or [interactively](https://github.com/gwen-interpreter/gwen/wiki/Execution-Modes#interactive-repl-execution)
* Tests can be run [sequentially](https://github.com/gwen-interpreter/gwen/wiki/Execution-Modes#serial-execution) or in [parallel](https://github.com/gwen-interpreter/gwen/wiki/Execution-Modes#parallel-execution)
* Tests can be [data driven](https://github.com/gwen-interpreter/gwen/wiki/Execution-Modes#csv-data-feeds) (using csv data feeds)
* [REPL console](https://github.com/gwen-interpreter/gwen/wiki/REPL-Console) allows verifying before running
* Cross browser support
* Remote web driver support
* Screenshot capture and slideshow playback
* [Interchangeable Selenium](https://github.com/gwen-interpreter/gwen-web/wiki/Runtime-Settings#changing-the-selenium-version) implementation
* [Locator Chaining](https://github.com/gwen-interpreter/gwen-web/wiki/Locator-Chaining)

Runtime Requirements
--------------------

- Java SE 8 Runtime Environment
- A web browser
- Native web driver
  - [Chrome](https://sites.google.com/a/chromium.org/chromedriver/)
  - [Edge](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)
  - [Firefox](https://github.com/mozilla/geckodriver/releases)

Quick Links to Wiki Information
-------------------------------
- [Installation](https://github.com/gwen-interpreter/gwen-web/wiki/Installation) 
- [Getting Started](https://github.com/gwen-interpreter/gwen-web/wiki/Getting-Started)
- [Gwen-Web DSL](http://htmlpreview.github.io/?https://github.com/gwen-interpreter/gwen-web/blob/master/docs/dsl/gwen-web-dsl.html)
- [REPL Console](https://github.com/gwen-interpreter/gwen-web/wiki/REPL-Console)

Mail Group
----------

All announcements and discussions are posted and broadcast to all members in 
the following mail group. You are welcome to visit and subscribe to receive 
notifications or get involved.

- [gwen-interpreter](https://groups.google.com/d/forum/gwen-interpreter) 

Development Guide
-----------------

See the [Dev Guide](https://github.com/gwen-interpreter/gwen-web/wiki/Development-Guide) if you would like to work with the code 
or build the project from source.

Contributions
-------------

New capabilities, improvements, and fixes are all valid candidates for 
contribution. Submissions can be made using pull requests. Each submission 
is reviewed and verified by the project committers before being integrated 
and released to the community. We ask that all code submissions include unit 
tests or sample test features providing relevant coverage.

By submitting contributions, you agree to release your work under the 
license that covers this software.

License
-------

Copyright 2014-2017 Brady Wood, Branko Juric

This software is open sourced under the 
[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

See also: [LICENSE](LICENSE).

This project has dependencies on [gwen](https://github.com/gwen-interpreter/gwen) 
and other open source projects. All distributed third party depdendencies and 
their licenses are listed in the [LICENSE-THIRDPARTY](LICENSE-THIRDPARTY) 
file.

Open sourced 28 June 2014 03:27 pm AEST
