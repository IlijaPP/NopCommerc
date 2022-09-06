*** Variables ***
${ItemList}       xpath=//div[@class='item-grid']
${Intel_i5}       id=attribute-option-6
${RAM_8GB}        id=attribute-option-9
${CommonProductLoc}    xpath=//div[@class='product-item']
${SortBy}         id=products-orderby
${ProductPrice}    xpath=//span[@class='price actual-price']
${HTC_One_M8}     xpath=//a[@title='Show details for HTC One M8 Android L 5.0 Lollipop']
${Nokia_Lumia}    xpath=//a[@title='Show details for Nokia Lumia 1020']
${Build_PC}       (//a[@href='/build-your-own-computer'])[1]
${AddToWish_FirstPrizePies}    xpath=(//button[@class='button-2 add-to-wishlist-button'])[2]
${GoToWishList}    xpath=(//a[@href='/wishlist'])[1]
${511_Jeans}      xpath=(//a[@href='/levis-511-jeans'])[1]
${ProductCount_File}    ${EXECDIR}\\Resources\\ProductCount.xlsx
