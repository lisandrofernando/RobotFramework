*** Settings *** 
# Declaring a module name in a robot file.

Documentation   To validate the login form
Library     SeleniumLibrary
Library     Collections
Test Setup      Open The Broswer With The Ecomerce Payment Url      
Test Teardown   Close Browser
Resource        ../resources/resource.robot
Resource        ../pageObjects/loginPage.robot
Resource        ../pageObjects/landingPage.robot

#Resource

*** Test Cases ***
validate UnSuccessful login
        loginPage.Fill the login Form     ${InvalidUsername}     ${InvalidPassword}    
        loginPage.wait until Element is located in the page     
        loginPage.verify error message is correct

Validate Cards displayed in the Shopping Page
        loginPage.Fill the login Form     ${username}     ${password}
        landingPage.wait until Element is located in the page   
        landingPage.Verify Card Titles in the Shop page 
        landingPage.Select the Card         Blackberry  

# Select the Form and Navigate to Child window  
#          Fill the login Details and select the User option      ${username}     ${password}


 



