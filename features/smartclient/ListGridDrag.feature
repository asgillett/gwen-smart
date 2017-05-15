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
   Feature: ListGridDrag

  Scenario: Drag and Drop items between two ListGrids

      Given I navigate to "http://localhost:8080/examples/components/listGrid_drag.html"
        And the right grid can be located by scLocator "//ListGrid[ID='list2']/body/"
        And the top left element can be located by scLocator "//ListGrid[ID='list1']/body/row[0]/col[0]"
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
       Then I drag the top left element to the right grid
        And the left grid can be located by scLocator "//ListGrid[ID='list1']/body/"
        And the top right element can be located by scLocator "//ListGrid[ID='list2']/body/row[0]/col[0]"
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid
       Then I drag the top right element to the left grid

       Then I close the browser