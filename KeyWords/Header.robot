*** Settings ***
Resource          ../Locators/Header.robot
Resource          ../Locators/PLP.robot
Resource          ../KeyWords/PLP.robot
Resource          ../KeyWords/SetupTearDown.robot
Resource          ../Resources/PLP.robot
Resource          ../Resources/TestData.robot
Library           SeleniumLibrary
Library           String
Library           Collections

*** KeyWords ***
Navigate To Cell Phones
    Mouse Over    ${ElectronicsTab}
    Click Element    ${CellPhonesMenu}
    Location Should Be    ${CellPhones_URL}

Navigate to Desktop Computers
    Mouse Over    ${ComputersTab}
    Click Element    ${DesktopsMenu}
    Location Should be    ${DesktopsLINK}

Navigate To Clothing Menu
    Mouse Over    ${ApparelTab}
    Click Element    ${ClothingMenu}
    Location Should Be    ${Clothing_URL}
