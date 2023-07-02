*** Settings ***
Documentation  To validate login form
Library        SeleniumLibrary
Library        ../virtualEnvironment/lib/python3.10/site-packages/robot/libraries/Collections.py
Library        ../CustomLibraries/Shop.py
Test Setup     open the browser with the url    Chrome
#Task Teardown  Close Browser session
Resource       ../PageObjects/Generic.robot
Resource       ../PageObjects/LandingPage.robot
Resource       ../PageObjects/ShopPage.robot
Resource       ../PageObjects/CheckoutPage.robot
Resource       ../PageObjects/ConfirmationPage.robot



*** Variables ***
${listofProducts}    Blackberry    Nokia Edge
${country}    India

*** Test Cases ***
Validate unsuccessful Login
    [Tags]    UNSUCCESSFUL
    LandingPage.Fill the login form    ${user_name}    ${invalid_password}
    LandingPage.wait until element is located in the page    
    LandingPage.verify error message is correct

Validate Cards display in the Shopping Page
    [Tags]    SUCCESSFUL
    LandingPage.Fill the login form    ${username2}    ${valid_password}
    ShopPage.wait until element is located in the page   
    ShopPage.Verify Card titles in the Shop page
    add items to cart and checkout    ${listofProducts}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms    ${country}
    ConfirmationPage.Purchase the Product and Confirm the Purchase

# Select the Form and navigate to Child Window
#     LandingPage.Fill the Login details and Login form








   





    

