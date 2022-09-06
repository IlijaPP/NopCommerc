*** Settings ***
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

*** KeyWords ***
Open Books Tab
    Click Element    ${BooksTab}
    Location Should Be    ${Books_URL}

ADD Item To Wish List
    Wait Until Element Is Visible    ${AddToWish_FirstPrizePies}
    Click Element    ${AddToWish_FirstPrizePies}
    Wait Until Element Is Visible    ${NotificationBar}
    Element Should Be Visible    ${NotificationBar}

Go To Wish List
    Wait Until Keyword Succeeds    3    0.1    Click Element    ${GoToWishList}
    Location Should Be    ${WishList_URL}

Change Item Quantity
    Input Text    ${QuantityField}    5
    Wait Until Keyword Succeeds    5    0.5    Click Element    ${UpdateWishList}

Validate Price Change
    Location Should Be    ${WishList_URL}
    ${CurrentPrice}    Get Text    ${ItemPrice}
    ${CurrentPrice}    Remove String    ${CurrentPrice}    $    .
    ${CurrentPrice}    String.Get Substring    ${CurrentPrice}    0    2
    ${CurrentPrice}    Convert To Number    ${CurrentPrice}
    ${TotalPrice}    Get Text    ${TotalItemPrice}
    ${TotalPrice}    Remove String    ${TotalPrice}    $    .
    ${TotalPrice}    String.Get Substring    ${TotalPrice}    0    3
    ${TotalPrice}    Convert To Number    ${TotalPrice}
    ${CurrentQuantity}    Get Value    ${QuantityField}
    ${CurrentQuantity}    Convert To Integer    ${CurrentQuantity}
    Should Be True    ${CurrentPrice}*${CurrentQuantity}==${TotalPrice}
