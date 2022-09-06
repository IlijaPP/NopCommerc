*** Settings ***
Resource          ../Locators/Header.robot
Resource          ../Locators/PLP.robot
Resource          ../Locators/PDP.robot
Resource          ../Locators/Wish_List.robot
Resource          ../Locators/Shopping_Cart.robot
Resource          ../KeyWords/Wish_List.robot
Resource          ../KeyWords/SetupTearDown.robot
Resource          ../Resources/PLP.robot
Resource          ../Resources/TestData.robot
Library           SeleniumLibrary
Library           String
Library           Collections

*** KeyWords ***
Open Shopping Cart
    Wait Until Element Is Visible    ${NotificationBar}
    Wait Until Keyword Succeeds    5    0.1    Click Element    ${OpenShoppingCart}
    Location Should be    ${ShoppingCart_URL}

Change Product Quantity
    Set Suite Variable    ${QuantityNUM}    11
    Wait Until Keyword Succeeds    5    0.5    Input Text    ${Cart_QuantityInput}    ${QuantityNUM}
    Wait Until Keyword Succeeds    5    0.5    Click Button    ${Update_Cart}

Validate Price Discount
    ${ItemQuantity}    Get Value    ${Cart_QuantityInput}
    Log    ${ItemQuantity}
    IF    ${ItemQuantity}<3
    Element Text Should Be    ${Cart_ItemPrice}    $43.50
    ELSE IF    3<=${ItemQuantity}<7
    Element Text Should Be    ${Cart_ItemPrice}    $40.00
    ELSE IF    7<=${ItemQuantity}<10
    Element Text Should Be    ${Cart_ItemPrice}    $38.00
    ELSE IF    ${ItemQuantity}>=10
    Element Text Should Be    ${Cart_ItemPrice}    $35.00
    END
    ${Cart_ItemPrice}    Get Text    ${Cart_ItemPrice}
    ${Cart_ItemPrice}    Remove String    ${Cart_ItemPrice}    $    .
    ${Cart_ItemPrice}    Get Substring    ${Cart_ItemPrice}    0    2
    ${Cart_ItemPrice}    Convert To Number    ${Cart_ItemPrice}
    ${TotalPrice}    Get Text    ${Cart_TotalPrice}
    ${TotalPrice}    Remove String    ${TotalPrice}    $    .
    ${TotalPrice}    Get Substring    ${TotalPrice}    0    3
    ${TotalPrice}    Convert To Number    ${TotalPrice}
    Should be true    ${ItemQuantity}*${Cart_ItemPrice}==${TotalPrice}
