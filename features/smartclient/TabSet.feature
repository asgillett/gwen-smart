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
   Feature: TabSet

  Scenario: Exercise a TabSet

      Given I navigate to "http://localhost:8080/examples/components/tabSet_init.html"
        And the red panel can be located by scLocator "//Canvas[ID='pane1']"
        And the green panel can be located by scLocator "//Canvas[ID='pane2']"
        And the blue panel can be located by scLocator "//Canvas[ID='pane3']"
        And the red tab can be located by scLocator "//TabSet[ID='tabSet']/tab[title=red||index=0]/"
        And the green tab can be located by scLocator "//TabSet[ID='tabSet']/tab[title=green||index=1]/"
        And the blue tab can be located by scLocator "//TabSet[ID='tabSet']/tab[title=blue||index=2]/"

       Then the red panel should be displayed
        And the green panel should be hidden
        And the blue panel should be hidden

       Then I click the green tab
        And the red panel should be hidden
        And the green panel should be displayed
        And the blue panel should be hidden

       Then I click the blue tab
        And the red panel should be hidden
        And the green panel should be hidden
        And the blue panel should be displayed

       Then I click the red tab
        And the red panel should be displayed
        And the green panel should be hidden
        And the blue panel should be hidden
