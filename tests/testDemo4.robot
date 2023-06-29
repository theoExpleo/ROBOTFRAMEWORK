*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser
Test Template    Validate unsuccessful Login

*** Variables ***
${Error_message_Login}    css:.alert-danger

*** Test Cases ***     username     password
Invalid username       dsahed       learning
Invalid password       rahulshetty  ploudfg
special characters     @#$          learning  



*** Keywords ***
Validate unsuccessful Login
    [Arguments]    ${username}    ${password}
    open the browser with the Mortgage payment url
    Fill the login form    ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct


open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=/home/dsf12/Documents/VsCode/RobotFramework/Drivers/chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_message_Login}

verify error message is correct
    # This uses the defining variable approach
    ${result}=     Get Text    ${Error_message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    
    # Same as the code above. This uses the selenium library
    Element Text Should Be    ${Error_message_Login}    Incorrect username/password.
    
    


 