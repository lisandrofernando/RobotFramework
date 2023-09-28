*** Settings ***
Documentation       A loginPage page file where all the objects from loginPage will be stored
Library         SeleniumLibrary


*** Variables ***
${ErrorMessageLogin}            css:.alert-danger 

*** Keywords ***
wait until Element is located in the page
        Wait Until Element Is Visible        ${ErrorMessageLogin}    

Fill the Login Form
        [Arguments]     ${username}     ${password}
        Input Text      id:username      ${username}
        Input Password  id:password      ${password}
        Click Button    id:signInBtn

verify error message is correct
      ${result} =  Get Text       ${ErrorMessageLogin}  
      Should Be Equal As Strings        ${result}       Incorrect username/password.

Fill the login Details and select the User option
         [Arguments]     ${username}     ${password}
         Input Text      id:username      ${username}
         Input Password  id:password      ${password}
         Click Element   CSS: input[value='user']
         Wait Until Element Is Visible    CSS:.modal-body
         Click Button     id:okayBtn
         Click Button     id:okayBtn
         Wait Until Element Is Not Visible   CSS:.modal-body
         Select From List By Value      CSS:select.form-control     teach  #There is a bug in this line
         Select Checkbox      terms 
         Checknox Should Be Selected    terms