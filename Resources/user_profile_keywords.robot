*** Settings ***
Variables   ${OUTPUTDIR}/Pages/locators.py

*** Keywords ***
Open User Profile
    [Documentation]   This keyword open user profile
    Wait For Elements State   selector=${username_txt_link}   state=visible
    Browser.Click   selector=${username_txt_link}

Get Logged In User Name
    [Documentation]   This keyword fetches the name of the user
    ${username}   Browser.Get Text  selector=${user_profile_user_name}
    Set Test Variable   ${username}   ${username}

Validate User Profile Url
    [Documentation]   This keyword validates the user profile url
    ${url}   Browser.Get Url
    Should End With  ${url}   profile/${username}  message=User profile url is not navigated properly.

Open My Posts
    [Documentation]   This Keyword Ensures thet My posts are open
    Browser.Click   selector=${user_profile_my_posts_txt}


