*** Settings *** 
# Declaring a module name in a robot file.

Documentation   To validate the login form
Library     SeleniumLibrary
Library     DataDriver        file=resources/data.csv            dialect=unix
Test Teardown   Close Browser
Test Template   Validate UnSuccessful Login
Resource        ../resources/resource.robot

#Resource

*** Variables ***
${ErrorMessageLogin}            css:.alert-danger 

*** Test Cases ***
Login with user ${username} and password {password}

*** Keywords ***
Validate UnSuccessful Login
        [Arguments]     ${username}     ${password}
Fill the Login Form
        [Arguments]     ${username}     ${password}
        Input Text      id:username     ${username}
        Input Password  id:password     ${password}
        Click Button    id:signInBtn

wait until it checks and display error message
        Wait Until Element Is Visible           ${ErrorMessageLogin}    

 verify error message is correct
      ${result} =  Get Text       ${ErrorMessageLogin}  
      Should Be Equal As Strings        ${result}       Incorrect username/password.
