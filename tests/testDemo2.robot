*** Settings ***
Documentation  To validate login form
Library        SeleniumLibrary
Task Setup     open the browser with the Mortgage payment url
Task Teardown  Close Browser session
Resource       resource.robot





*** Variables ***
${Error_message_Login}    css:.alert-danger
${shop_page_load}    css:nav-link

*** Test Cases ***
Validate unsuccessful Login
    Fill the login form    ${user_name}    ${invalid_password}
    wait until element is located in the page    ${Error_message_Login}
    verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login form    ${username2}    ${valid_password}
    wait until element is located in the page    ${shop_page_load}

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
   