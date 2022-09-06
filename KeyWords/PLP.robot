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
Navigate to Notebooks
    Mouse Over    ${ComputersTab}
    Click Element    ${NotebooksMenu}
    Element Should Be Visible    ${ItemList}
    Page Should Contain    ${HP_Notebook}
    Number of Products

Select CPU Filter
    [Arguments]    ${arg1}
    Click Element    ${arg1}
    Element Should Be Enabled    ${arg1}
    Sleep    2
    Number of Products filtered by CPU

Select RAM Filter
    [Arguments]    ${arg1}
    Click Element    ${arg1}
    Element Should Be Enabled    ${arg1}
    Sleep    2
    Number of Products filtered by RAM

Remove CPU FIlter
    [Arguments]    ${arg1}
    Element Should Be Enabled    ${arg1}
    Click Element    ${arg1}
    Sleep    1
    ${RemovedFilterCount}    Get Element Count    ${CommonProductLoc}
    ${RemovedFilterCount}    Convert To String    ${RemovedFilterCount}
    Set Suite Variable    ${RemovedFilterCount}
    Should Be Equal As Strings    ${RemovedFilterCount}    ${ItemListCount}

Sort By High to Low Price
    Select From List By Value    ${SortBy}    11

Sort By Low to High Price
    Select From List By Value    ${SortBy}    10

Number of Products
    ${ItemListCount}    Get Element Count    ${CommonProductLoc}
    ${ItemListCount}    Convert To String    ${ItemListCount}
    Set Suite Variable    ${ItemListCount}

Number of Products filtered by CPU
    ${FilteredCPU}    Get Element Count    ${CommonProductLoc}
    ${FilteredCPU}    Convert To String    ${FilteredCPU}
    Set Suite Variable    ${FilteredCPU}
    Should Not Be Equal As Strings    ${FilteredCPU}    ${CommonProductLoc}

Number of Products filtered by RAM
    ${FilteredRAM}    Get Element Count    ${CommonProductLoc}
    ${FilteredRAM}    Convert To String    ${FilteredRAM}
    Set Suite Variable    ${FilteredRAM}
    Should Not Be Equal As Strings    ${FilteredRAM}    ${CommonProductLoc}

Get ALL Products Prices
    Number of Products
    @{SortedList}    Create List
    @{PriceList}    Create List
    FOR    ${i}    IN RANGE    1    ${ItemListCount}+1
        ${AllPrices}    Get Text    (//span[@class='price actual-price'])[${i}]
        ${AllPrices}    Remove String    ${AllPrices}    $    .    ,
        ${FinalPrice}    String.Get Substring    ${AllPrices}    0    4
        ${Price_NUM}    Convert To Number    ${FinalPrice}
        Append To List    ${PriceList}    ${Price_NUM}
        Append To List    ${SortedList}    ${Price_NUM}
    END
    Log    Price List = ${PriceList}
    Sort List    ${SortedList}
    Log    Sorted List = ${SortedList}
    ${ReversedList}    Copy List    ${SortedList}
    Reverse List    ${ReversedList}
    Log    Reversed List = ${ReversedList}
    ${sortText}    Get Value    ${SortBy}
    Run Keyword If    '${sortText}'=='11'    Should Be True    ${PriceList}==${ReversedList}
    ...    ELSE IF    '${sortText}'=='10'    Should Be True    ${PriceList}==${SortedList}

Open HTC_One_M8
    Click Element    ${HTC_One_M8}
    Element Should Contain    ${ProductName}    ${HTC_M8_TITLE}

Open Nokia_Lumia
    Click Element    ${Nokia_Lumia}
    Element Should Contain    ${ProductName}    ${Nokia_Lumia_TITLE}

Add Item To Compare List
    Element Should Be Visible    ${CompareButton}
    Click Element    ${CompareButton}
    Wait Until Element Is Visible    ${NotificationBar}
    Element Should Be Visible    ${NotificationBar}
    Element Should Contain    ${NotificationBar}    ${Success_ADD_To_Compare}

Open Compare Page
    Element Should Be Visible    ${NotificationBar}
    Click Element    ${Compare_Link}
    Page Should Contain    ${HTC_M8_TITLE}
    Page Should Contain    ${Nokia_Lumia_TITLE}

Open Build PC
    Element Should Be Visible    ${BuildPC}
    Click Element    ${BuildPC}
    Element Should Contain    ${ProductName}    ${BuildPC_TITLE}

Open 511_Jeans
    SeleniumLibrary.Wait Until Element Is Visible    ${511_Jeans}
    Click Element    ${511_Jeans}
    Location Should Be    ${511_Jeans_URL}
