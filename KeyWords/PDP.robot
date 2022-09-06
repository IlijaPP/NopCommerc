*** Settings ***
Resource          ../Locators/Header.robot
Resource          ../Locators/PLP.robot
Resource          ../Locators/PDP.robot
Resource          ../KeyWords/PLP.robot
Resource          ../KeyWords/SetupTearDown.robot
Resource          ../Resources/PLP.robot
Resource          ../Resources/TestData.robot
Library           SeleniumLibrary
Library           String
Library           Collections

*** KeyWords ***
How Many Items To Display
    Select From List By Value    ${DisplayedProductNumber}    3
    Sleep    2
    ${DisplayedProductText}    Get Value    ${DisplayedProductNumber}
    ${ElementCout}    SeleniumLibrary.Get Element Count    ${CommonProductLoc}
    Should Be True    ${ElementCout}==${DisplayedProductText}

Build PC Select Ram
    Select From List By Value    ${BuildPC_SelectRam_2GB}    3

Build PC Select HDD
    Click Element    ${BuildPC_SelectHDD_400GB}

Build PC Select OS
    Click Element    ${BuildPC_SelectOS_VistaHome}

Build PC Select Software
    Click Element    ${BuildPC_SelectSoftware_AcrobatReader}
    Click Element    ${BuildPC_SelectSoftware_TotalCommander}

ADD To Cart
    Click Button    ${AddToCartButton}
    SeleniumLibrary.Wait Until Element Is Visible    ${NotificationBar}
    Element Should Be Visible    ${NotificationBar}
