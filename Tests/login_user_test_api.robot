*** Settings ***
Resource            ./settings.robot
Force Tags          API_TEST

*** Test Cases ***
Authenticate Existing User
    [Documentation]  This test case will authenticate the user
    Authenticate A User   ${login_emailId}  ${login_pwd}  ${auth_user}  ${auth_pwd}
    Validate Authenticated User

Register New User
    [Documentation]   This test case will register and validate a new user
    New User Registration   ${login_pwd}  ${auth_user}  ${auth_pwd}
    Validate Registered User

Get Current Signed In User
    [Documentation]   This keyword will return the current user
    Get Current Active User   ${login_emailId}  ${login_pwd}  ${auth_user}  ${auth_pwd}
    Validate Current User