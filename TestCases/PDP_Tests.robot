*** Settings ***
Test Setup        Open Application
Test Teardown     Close Application
Resource          ../KeyWords/SetupTearDown.robot
Resource          ../KeyWords/PLP.robot
Resource          ../KeyWords/PDP.robot
Resource          ../Resources/PLP.robot
Resource          ../KeyWords/Header.robot
Library           SeleniumLibrary

*** Test Cases ***
TC008-Build PC
    Navigate to Desktop Computers
    Open Build PC
    Build PC Select Ram
    Build PC Select HDD
    Build PC Select OS
    Build PC Select Software
    ADD To Cart

*** Keywords ***
