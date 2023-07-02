*** Settings ***
Documentation  To validate login form
Library        SeleniumLibrary
Library        String
Library        Collections

Test Setup     open the browser with the url  Chrome
Test Teardown  Close Browser session
Resource       ../PageObjects/Generic.robot


*** Variables ***
${Error_message_Login}    css:alert-danger
${email}    {EMPTY}


*** Test Cases ***
Validate Child Window Functionality
    Select the Link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email


*** Keywords ***
Select the Link of Child window
    Click Element    css:.blinkingText
    Sleep    5

Verify the user is Switched to Child window
    switch window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the Email id in the Child Window
    ${text}=    Get Text    css:.red
    ${words}=   Split String    ${text}    at
    #0 -> Please email us
    #1 -> mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=    Get From List    ${words}    1
    Log    ${text_split}
    @{words_2}=    Split String    ${text_split}
    #0 -> mentor@rahulshettyacademy.com

    ${email}=    Get From List    ${words_2}    0   
    
    Set Global Variable    ${email}

Switch to Parent window and enter the Email
    Switch Window      MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text         id:username    ${email}

