*** Settings ***
Test Setup        Open Application
Test Teardown     Close Application
Resource          ../Locators/Header.robot
Resource          ../Locators/PLP.robot
Resource          ../Locators/PDP.robot
Resource          ../Locators/Wish_List.robot
Resource          ../KeyWords/Wish_List.robot
Resource          ../KeyWords/SetupTearDown.robot
Resource          ../KeyWords/Shopping_Cart.robot
Resource          ../KeyWords/Header.robot
Resource          ../KeyWords/PLP.robot
Resource          ../KeyWords/PDP.robot
Resource          ../Resources/PLP.robot
Resource          ../Resources/TestData.robot
Library           SeleniumLibrary
Library           String
Library           Collections

*** Test Cases ***
TC024-Check if the price changes according the discount given for the product
    Navigate To Clothing Menu
    Open 511_Jeans
    ADD To Cart
    Open Shopping Cart
    Change Product Quantity
    Validate Price Discount
