*** Settings ***
Documentation  To validate login form
Library        SeleniumLibrary
Task Setup     open the browser with the Mortgage payment url
Task Teardown  Close Browser session
Resource       resource.robot





*** Variables ***
${Error_message_Login}    css:.alert-danger

*** Test Cases ***
Validate unsuccessful Login
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=/home/dsf12/Documents/VsCode/RobotFramework/Drivers/chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${invalid_password}
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_message_Login}

verify error message is correct
    # This uses the defining variable approach
    ${result}=     Get Text    ${Error_message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    
    # Same as the code above. This uses the selenium library
    Element Text Should Be    ${Error_message_Login}    Incorrect username/password.
   