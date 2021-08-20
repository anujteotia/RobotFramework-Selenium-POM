*** Settings ***
Library    Browser
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

Check Sign Up Error Message
    [Documentation]   This keyword checks whether sign up is successful by checking error message.
    Sleep  3s
    ${status}   Run Keyword And Return Status   Browser.Get Text   ${sign_up_error_txt}
    Run Keyword If   ${status}   Fail   msg=An Error Occurred!. Email/Username already exists

Verify Sign Up
    [Documentation]  This keyword verifies whether sign up is successfull or not
    [Arguments]   ${username}
    ${browser_url}   Catenate    SEPARATOR=   ${site_url}   /
    Browser.Get Url   assertion_operator=should be  assertion_expected=${browser_url}   message=Sign up unsuccessful
    ${user_xpath}   Catenate  SEPARATOR=   ${signed_up_username}   ${username}']
    Wait For Elements State   selector=${user_xpath}   state=visible
    ${output}   Browser.Get Text   selector=${user_xpath}  assertion_operator=should be  assertion_expected=${username}
    ...   message=Sign up unsuccessful


