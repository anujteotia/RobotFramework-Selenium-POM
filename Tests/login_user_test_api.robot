*** Settings ***
Resource            ./settings.robot
Force Tags          API_TEST

*** Variables ***
${bio}          Updating User Bio
${image}        image_url.png

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

#Update The Details Of Existing User
#    [Documentation]   This keyword will update the existing User
#    Update Existing User   ${login_emailId}  ${login_pwd}  ${bio}  ${image}  ${auth_user}  ${auth_pwd}