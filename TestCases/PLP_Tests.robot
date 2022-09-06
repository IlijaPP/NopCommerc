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
TC001-Navigate to HP Envy Product
    Navigate to Notebooks

TC002-Filter by CPU i5 and 8GB RAM
    Navigate to Notebooks
    Number of Products
    Select CPU Filter    ${Intel_i5}
    Number of Products filtered by CPU
    Select RAM Filter    ${RAM_8GB}
    Number of Products filtered by RAM

TC003-Remove Filter
    Navigate to Notebooks
    Select CPU Filter    ${Intel_i5}
    Number of Products filtered by CPU
    Remove CPU Filter    ${Intel_i5}

TC004-Verify Sorting By High to Low Price
    Navigate to Notebooks
    Sort By High to Low Price
    Sleep    1
    Get ALL Products Prices

TC005-Verify Sorting By Low to High Price
    Navigate to Notebooks
    Sort By Low to High Price
    Sleep    1
    Get ALL Products Prices

TC009-Compare Two Products
    Navigate To Cell Phones
    Open HTC_One_M8
    Add Item To Compare List
    Open Nokia_Lumia
    Add Item To Compare List
    Open Compare Page

TC004-Verify Displaying Option
    Navigate to Notebooks
    How Many Items To Display
