*** Settings *** 
# Declaring a module name in a robot file.

Documentation   To validate the login form
Library     SeleniumLibrary
Library     ../customLibraries/Shop.py
Test Teardown   Close Browser
Resource        ../resources/resource.robot
#Resource

*** Variables ***
${ErrorMessageLogin}            css:.alert-danger 

*** Test Cases ***
validate UnSuccessful login
        Open The Broswer With The Ecomerce Payment Url
        Fill the login Form
        wait until it checks and display error message
        verify error message is correct


*** Keywords ***
Fill the Login Form
        Input Text      id:username     lisandrodossantossilvafernando
        Input Password  id:password     123456
        Click Button    id:signInBtn

wait until it checks and display error message
        Wait Until Element Is Visible           ${ErrorMessageLogin}    

 verify error message is correct
      ${result} =  Get Text       ${ErrorMessageLogin}  
      Should Be Equal As Strings        ${result}       Incorrect username/password.

       


