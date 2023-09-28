*** Settings ***
Documentation       A loginPage page file where all the objects from loginPage will be stored
Library         SeleniumLibrary


*** Variables ***
${ShopPageLoad}                 css:.nav-link

*** Keywords ***
wait until Element is located in the page
        Wait Until Element Is Visible         ${ShopPageLoad}  

Verify Card Titles in the Shop page
        @{expectedList} =       Create List     iphone X        Samsung Note 8          Nokia Edge      Blackberry    
        ${elements} =           Get WebElements         CSS:.card-title
        @{actualList} =         Create List 

        FOR     ${element}         IN       @{elements}
            Log    ${element.text}
            Append To List      ${actualList}           ${element.text}
        END
        Lists Should Be Equal          ${expectedList}          ${actualList}

Select the Card 
        [Arguments]     ${cardName}
        ${elements} =           Get WebElements         CSS:.card-title
        ${index} =      Set Variable        1
         FOR     ${element}         IN       @{elements}
                 Exit For Loop If       '${cardName}' == '${element.text}'
                 ${index} =     Evaluate        ${index} + 1
        END
        Click Button    xpath:(//*[@class='card-footer'])[${index}]/button