# 
# Copyright 2017 Andrew Gillett
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
   Feature: Form Items

  Scenario: Exercise the dynamic form items

      Given I navigate to "http://localhost:8080/examples/components/dynamicForm_item_types.html"

        And the static text field can be located by scLocator "scLocator=//DynamicForm[ID='itemsForm']/item[name=item3]/textbox"
        And I wait for the static text field
       Then the static text field should be "staticText value"

        And the text field can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item4]/element"
       Then the text field should be "text value"
        And I type "foobar" in the text field
       Then the text field should be "foobar"

        And the checkbox can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item8]/valueicon"
       Then the checkbox should be checked
        And I uncheck the checkbox
       Then the checkbox should be unchecked

        And the radio group field can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item9]/element"
       Then the radio group field should be "a"
        And the radio group item can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item9]/item[title=option b]/element"
        And I check the radio group item
       Then the radio group field should be "b"

        And the select field can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item10]/"
       Then the select field should be "b"
        And the select field picker can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item10]/[icon='picker']"
       Then I click the select field picker
        And the select option_d can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item10]/pickList/body/row[item10=d]/col[fieldName=item10]"
        And I click the select option_d
       Then the select field should be "d"

        And the multi select field can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item11]/"
       Then the multi select field should be "[c]"
        And the multi select picker can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item11]/[icon='picker']"
       Then I click the multi select picker
        And the multi select option_a can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item11]/pickList/body/row[0]/col[0]/valueicon"
        And I click the multi select option_a
       Then the multi select field should be "[a, c]"
        And I press tab in the multi select field

        And the selectOther field can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item12]/"
       Then the selectOther field should be "d"
        And the selectOther field picker can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item12]/[icon='picker']"
       Then I click the selectOther field picker
        And the selectOther option can be located by scLocator "//DynamicForm[ID='itemsForm']/item[name=item12]/pickList/body/row[item12=***other***]/col[fieldName=item12]"
        And I click the selectOther option
        And the other value field can be located by scLocator "//autoID[Class=Dialog||title=Please%20enter%20a%20value||scRole=alertdialog]/item[0][Class='DynamicForm']/item[name=value]/element"
        And I type "froboz" in the other value field
        And the ok button can be located by scLocator "//autoID[Class=Dialog||title=Please%20enter%20a%20value||scRole=alertdialog]/okButton/"
        And I click the ok button
       Then the selectOther field should be "froboz"

# Cannot get value of time or date fields

        And the reset button can be located by scLocator "//DynamicForm[ID='itemsForm']/item[title=reset||Class=ResetItem]/button/"
       Then I click the reset button
       Then the text field should be "text value"
       Then the checkbox should be checked
       Then the radio group field should be "a"
       Then the select field should be "b"
       Then the multi select field should be "[c]"
       Then the selectOther field should be "d"

#        And the toolbar 1 button can be located by scLocator "//DynamicForm[ID='itemsForm']/item[index=19||Class=ToolbarItem]/canvas/member[Class=IAutoFitButton||index=0||length=3||classIndex=0||classLength=3||roleIndex=0||roleLength=3||title=toolbar%201||scRole=button]/"
#       Then I click the toolbar 1 button
#       Then I accept the alert popup


