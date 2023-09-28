*** Settings ***
Documentation       A loginPage page file where all the objects from loginPage will be stored
Library         SeleniumLibrary


*** Variables ***
${ShopPageLoad}                 css:.nav-link
${ErrorMessageLogin}            css:.alert-danger 

*** Keywords ***
wait until Element is located in the page
        Wait Until Element Is Visible         ${ErrorMessageLogin} 