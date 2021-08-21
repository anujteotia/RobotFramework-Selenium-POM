*** Settings ***
Variables   ${OUTPUTDIR}/Pages/locators.py

*** Keywords ***
Validate Register Url
    [Documentation]   This keyword validates tile of the home page
    ${url}   Browser.Get Url  assertion_operator=should end with  assertion_expected=register  message=Unable to open register page.
    Log    ${url}

Enter User Name
    [Documentation]  This keyword enter user name for sign up
    [Arguments]   ${username}
    Fill Text   selector=${username_txt_box}   txt=${username}

Enter Email Id
    [Documentation]  This keyword enter email id for sign up
    [Arguments]   ${email_id}
    Fill Text   selector=${email_txt_box}   txt=${email_id}

Enter Password
    [Documentation]  This keyword enter password for sign up
    [Arguments]   ${password}
    Fill Secret   selector=${pwd_txt_box}   secret=$password

Click Sign Up Button
    [Documentation]  This keyword clicks on the sign up button
    Browser.Click   selector=${sign_up_button}

Verify Sign Up
    [Documentation]  This keyword verifies whether sign up is successfull or not
    [Arguments]   ${username}
    Browser.Get Url   assertion_operator=should be  assertion_expected=${site_url}/   message=An Error Occurred!. Email/Username already exists
    ${user_xpath}   Catenate  SEPARATOR=   ${signed_up_username}   ${username}']
    Wait For Elements State   selector=${user_xpath}   state=visible
    ${output}   Browser.Get Text   selector=${user_xpath}  assertion_operator=should be  assertion_expected=${username}
    ...   message=Sign up unsuccessful


