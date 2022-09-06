*** Settings ***
Test Setup        Open Application
Test Teardown     Close Application
Resource          ../Locators/Header.robot
Resource          ../Locators/PLP.robot
Resource          ../Locators/PDP.robot
Resource          ../Locators/Wish_List.robot
Resource          ../KeyWords/Wish_List.robot
Resource          ../KeyWords/SetupTearDown.robot
Resource          ../Resources/PLP.robot
Resource          ../Resources/TestData.robot
Library           SeleniumLibrary
Library           String
Library           Collections

*** Test Cases ***
TC007-Check if the total price is calculated correctly
    Open Books Tab
    ADD Item To Wish List
    Go To Wish List
    Change Item Quantity
    Validate Price Change
