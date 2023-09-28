*** Settings *** 
# Declaring a module name in a robot file.

Documentation   To validate the login form
Library     SeleniumLibrary
Test Teardown   Close Browser
Test Template   validate UnSuccessful login
Resource        ../resources/resource.robot

#Resource

*** Variables ***
${ErrorMessageLogin}            css:.alert-danger 

*** Test Cases ***      username        password
Invalid Username        loki            learning
Invalid Password        rahulshetty     ddddd
Special Characters      $#%%@           learning

*** Keywords ***
validate UnSuccessful login
        [Arguments]     ${username}     ${password}
        Open The Broswer With The Ecomerce Payment Url
        Fill the login Form     ${username}      ${password}
        wait until it checks and display error message
        verify error message is correct

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
