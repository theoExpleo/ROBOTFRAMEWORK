*** Settings ***
Documentation  To validate login form
Library        SeleniumLibrary
Library    ../virtualEnvironment/lib/python3.10/site-packages/robot/libraries/Collections.py
Test Setup     open the browser with the Mortgage payment url
#Task Teardown  Close Browser session
Resource       resource.robot





*** Variables ***
${Error_message_Login}    css:.alert-danger
${shop_page_load}    css:.nav-link

*** Test Cases ***
# Validate unsuccessful Login
#     Fill the login form    ${user_name}    ${invalid_password}
#     wait until element is located in the page    ${Error_message_Login}
#     verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login form    ${username2}    ${valid_password}
    wait until element is located in the page    ${shop_page_load}
    Verify Card titles in the Shop page
    Select the Card    Blackberry

Select the Form and navigate to Child Window

    Fill the Login details and Login form

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=/home/dsf12/Documents/VsCode/RobotFramework/Drivers/chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn


wait until element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}



verify error message is correct
    # This uses the defining variable approach
    ${result}=     Get Text    ${Error_message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    
    # Same as the code above. This uses the selenium library
    Element Text Should Be    ${Error_message_Login}    Incorrect username/password.
   

Verify Card titles in the Shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =  Get WebElements    css:.card-title
    @{actualList} =    Create List

    FOR  ${element}  IN     @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}


Select the Card
    [Arguments]    ${cardName}
    ${elements} =    Get WebElements    css:.card-title
    ${index} =    Set Variable    1

    FOR  ${element}  IN  @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=    Evaluate    ${index} + 1

    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    

Fill the Login details and Login form

    Input Text        id:username    ${username2}
    Input Password    id:password    ${valid_password}
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body

    # One click does not seem to have any effect, and so we include two
    Click Button   id:okayBtn
    Click Button   id:okayBtn
    Select From List By Value    css:select.form-control    teach    # Selects from DropDown
    Select Checkbox    terms
    Checkbox Should Be Selected    terms