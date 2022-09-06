*** Variables ***
${OpenShoppingCart}    xpath=(//a[@href='/cart'])[1]
${Cart_QuantityInput}    xpath=//input[@class='qty-input']
${Cart_ItemPrice}    xpath=//span[@class='product-unit-price']
${Cart_ItemTotalPrice}    xpath=//span[@class='product-subtotal']
${Update_Cart}    id=updatecart
${Cart_TotalPrice}    xpath=//span[@class='product-subtotal']
