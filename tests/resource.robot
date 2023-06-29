*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...
...              The system specific keywords created here form our own
...              domain specific langauge. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library          SeleniumLibrary

*** Variables ***
${user_name}    TheoExpleo
${username2}    rahulshettyacademy
${invalid_password}    1234567
${valid_password}    learning
${url}    https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver    Chrome    executable_path=/home/dsf12/Documents/VsCode/RobotFramework/Drivers/chromedriver
    Go To    ${url}

Close Browser session
    Close Browser