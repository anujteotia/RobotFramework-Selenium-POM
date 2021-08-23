*** Settings ***
Library     String
Library     ${OUTPUTDIR}/Libraries/Users.py
Variables   ${OUTPUTDIR}/Pages/locators.py

*** Keywords ***
Validate Login Url
    [Documentation]   This keyword validates tile of the home page
    ${login_url}   Browser.Get Url  assertion_operator=should end with  assertion_expected=login  message=Unable to open login page.
    Set Test Variable   ${login_url}   ${login_url}

Enter Sign In Email Id
    [Documentation]  This keyword enter email id for sign in
    [Arguments]   ${email_id}
    Fill Text   selector=${sign_in_email_txt_box}   txt=${email_id}

Enter Sign In Password
    [Documentation]  This keyword enter password for sign in
    [Arguments]   ${password}
    Fill Secret   selector=${sign_in_pwd_txt_box}   secret=$password

Click Sign In Button
    [Documentation]  This keyword clicks on the sign in button
    Browser.Click   selector=${sign_in_btn}

Verify Signed In
    [Documentation]  This keyword verifies whether sign in is successfull or not
    Browser.Get Url   assertion_operator=should be  assertion_expected=${site_url}/   message=An Error Occurred!. Email or password is invalid.
    Wait For Elements State   selector=${new_article_txt}   state=visible
    ${art_txt}   Browser.Get Text   selector=${new_article_txt}  assertion_operator=contains  assertion_expected=New Article
    ...   message=Sign In was unsuccessful

Authenticate A User
    [Documentation]   This keyword will authenticate the user using Basic Auth
    [Arguments]   ${email}  ${password}  ${auth_user}  ${auth_pwd}
    ${auth_user_data}   User Auth   ${email}  ${password}  ${auth_user}  ${auth_pwd}
    Set Test Variable   ${auth_user_data}   ${auth_user_data}
    Should Not Be Empty   ${auth_user_data}   msg=Unable to authenticate user

Validate Authenticated User
    [Documentation]   This keyword validates that authenticated user returns the correct data
    Dictionary Should Contain Key   dictionary=${auth_user_data['user']}   key=email   msg=email is not present
    Dictionary Should Contain Key   dictionary=${auth_user_data['user']}   key=username   msg=username is not present
    Dictionary Should Contain Key   dictionary=${auth_user_data['user']}   key=token   msg=jwt token is not present

New User Registration
    [Documentation]   This keyword registers a new user
    [Arguments]   ${login_pwd}  ${auth_user}  ${auth_pwd}
    ${login_username}   Generate Random String    12    [LOWER]
    ${login_emailId}   Catenate   SEPARATOR=   ${login_username}   @gmail.com
    ${registered_user}   User Registration   ${login_username}  ${login_emailId}  ${login_pwd}  ${auth_user}  ${auth_pwd}
    Set Suite Variable   ${registered_user}   ${registered_user}
    Should Not Be Empty   ${registered_user}   msg=Unable to register the user

Validate Registered User
    [Documentation]   This keyword will validates that user is registered successfully
    Dictionary Should Contain Key   dictionary=${registered_user['user']}   key=email   msg=email is not present
    Dictionary Should Contain Key   dictionary=${registered_user['user']}   key=username   msg=username is not present
    Dictionary Should Contain Key   dictionary=${registered_user['user']}   key=token   msg=jwt token is not present

Get Current Active User
    [Documentation]   This keyword will return current user
    [Arguments]    ${email}  ${password}  ${auth_user}  ${auth_pwd}
    ${current_user}   Get Current User   ${email}  ${password}  ${auth_user}  ${auth_pwd}
    Set Test Variable   ${current_user}   ${current_user}
    Should Not Be Empty   ${current_user}   msg=Unable to fetch current User

Validate Current User
    [Documentation]   This keyword will validates that user details are fetched correctly
    Dictionary Should Contain Key   dictionary=${current_user['user']}   key=email   msg=email is not present
    Dictionary Should Contain Key   dictionary=${current_user['user']}   key=username   msg=username is not present
    Dictionary Should Contain Key   dictionary=${current_user['user']}   key=token   msg=jwt token is not present

Update Existing User
    [Documentation]   This keyword updates the existing user details
    [Arguments]   ${email}  ${password}  ${bio}  ${image}  ${auth_user}  ${auth_pwd}
    ${updated_user}   Update User   ${email}  ${password}  ${bio}  ${image}  ${auth_user}  ${auth_pwd}
    Should Not Be Empty   ${updated_user}   msg=Unable to Update the User successfully


