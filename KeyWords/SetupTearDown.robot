*** Settings ***
Library           SeleniumLibrary

*** KeyWords ***
Open Application
    Open Browser    https://demo.nopcommerce.com/    chrome    alias=MainBrowser

Close Application
    Close Browser
