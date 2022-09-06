*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/TestData.robot
Resource          ../Locators/Search.robot
Resource          ../Locators/Header.robot
Library           ExcelRobot

*** KeyWords ***
Search For Product
    Input Text    ${SearchBar}    ${LaptopProduct}
    Click Button    ${SearchButton}

Select Category
    Click Element    ${AdvancedSearch}
    Select From List By Value    ${Category}    ${Categories.ComputersNotebooks}

Select Search In Product Description
    Click Element    ${Search_Product_Description}
    Element Should Be Enabled    ${Search_Product_Description}

Validate Search Product
    Click Button    ${DedicatedSearchButton}
    Element Should Contain    ${Item_List}    ${LaptopProduct}

Search Prodcut from Excel File
    Open Excel    ${Search_File}
    ${clumnCount}    Get Column Count    Sheet1
    ${rowCount}    Get Row Count    Sheet1
    FOR    ${column}    IN RANGE    0    ${clumnCount}
        ${value}    Read Cell Data    Sheet1    ${clumnCount}    0
        Input Text    ${SearchBar}    ${value}
        Click Button    ${SearchButton}
        Page Should Contain    ${value}
    END
