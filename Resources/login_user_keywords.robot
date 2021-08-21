*** Settings ***
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

