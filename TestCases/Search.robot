*** Settings ***
Test Setup        Open Application
Test Teardown     Close Application
Resource          ../KeyWords/SetupTearDown.robot
Resource          ../KeyWords/Search.robot
Resource          ../Locators/Search.robot
Resource          ../Resources/TestData.robot
Library           SeleniumLibrary

*** Test Cases ***
TCO12-Search for Product
    Search For Product
    Select Category
    Select Search In Product Description
    Validate Search Product

TC001-Search For Product from file
    Search Prodcut from Excel File
