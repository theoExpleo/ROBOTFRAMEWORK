*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource    Generic.robot

*** Variables ***
${Shop_page_load}        css:.nav-link
${country_location}      //a[text()='India']


*** Keywords ***

Enter the Country and select the terms
    [Arguments]    ${country_name}
    Input Text     country     ${country_name}
   # Sleep    2
    Wait Until Element Is Visible    //a[text()='${country_name}']    timeout=10
    Click Element    //a[text()='${country_name}']
    Click Element    css:.checkbox label
    #Click Element    css:.checkbox label
    #Sleep    2
   # Double Click Element    css:.checkbox label


Purchase the Product and Confirm the Purchase
    Click Button    css:.btn-success
    Page Should Contain    Success!