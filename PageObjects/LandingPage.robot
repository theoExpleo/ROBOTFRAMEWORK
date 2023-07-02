*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary

Resource    Generic.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger


*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until element is located in the page
  #  [Arguments]    ${element}
    Wait Until element passed is located on Page    ${Error_Message_Login}

verify error message is correct
    # This uses the defining variable approach
    ${result}=     Get Text    ${Error_message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    
    # Same as the code above. This uses the selenium library
    Element Text Should Be    ${Error_message_Login}    Incorrect username/password.

Fill the Login details and Login form
    
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    learning
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body

    # One click does not seem to have any effect, and so we include two
    Click Button   id:okayBtn
    Click Button   id:okayBtn
    Select From List By Value    css:select.form-control    teach    # Selects from DropDown
    Select Checkbox    terms
    Checkbox Should Be Selected    terms