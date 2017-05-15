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
   Feature: TreeGrid

  Scenario: Exercise a TreeGrid

      Given I navigate to "http://localhost:8080/examples/components/treeGrid_init.html"

# Check that Bottlenose Dolphin is visible
        And the tree grid can be located by scLocator "//TreeGrid[ID='animalViewer']"
       Then I wait for the tree grid done
        And the Bottlenose Dolphin can be located by scLocator "//TreeGrid[ID='animalViewer']/body/row[name=Bottlenose Dolphin]/col[fieldName=name]"
       Then the Bottlenose Dolphin should be "Bottlenose Dolphin"
        And the Bottlenose Dolphin Scientific Name can be located by scLocator "//TreeGrid[ID='animalViewer']/body/row[name=Bottlenose Dolphin]/col[fieldName=scientificName]"
       Then the Bottlenose Dolphin Scientific Name should be "Tursiops truncatus"

        And the Add Nurse Shark button can be located by scLocator "//autoID[Class=Button||title=Add Nurse Shark]/"       
        And I click the Add Nurse Shark button
        And the Nurse Shark can be located by scLocator "//TreeGrid[ID='animalViewer']/body/row[name=Nurse Shark]/col[fieldName=name]"
        And I wait for the Nurse Shark
       Then the Nurse Shark should be "Nurse Shark"

        And the Orangutan can be located by scLocator "//TreeGrid[ID='animalViewer']/body/row[name=Orangutan]/col[fieldName=name]"
       Then the Orangutan should be "Orangutan"
        And the Remove Orangutan button can be located by scLocator "//autoID[Class=Button||title=Remove Orangutan]/"
        And I click the Remove Orangutan button
        And I wait for the Orangutan to be not present



