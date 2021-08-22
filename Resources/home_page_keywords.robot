*** Settings ***
Variables   ${OUTPUTDIR}/Pages/locators.py

*** Keywords ***
Validate Title In Home Page
    [Documentation]   This keyword validates tile of the home page
    ${title}   Browser.Get Text   selector=${conduit_txt}  assertion_operator=should be  assertion_expected=conduit  message=Unable to open Conduit homepage.
    Log    ${title}

Validate Tags are present
    [Documentation]   This keyword validates that the tags are present in the homepage
    ${count_tags}   Browser.Get Element Count   selector=${homepage_tags}   assertion_operator=greater than
    ...   expected_value=1   message=Tags aren't present in homepage
    Log  ${count_tags}

List Of Articles Is Present
    [Documentation]   This keyword checks that global feed articles are present.
    ${count_articles}   Browser.Get Element Count   selector=${global_feed_articles}   assertion_operator=>=
    ...   expected_value=1   message=Articles aren't present in Global Feed
    Log  ${count_articles}

Validate Pagination On Home Page
    [Documentation]   This keyword checks for the list of pagination of articles
    ${count_pages}   Browser.Get Element Count   selector=${article_pagination}   assertion_operator=>=
    ...   expected_value=1   message=Feed Article Pagination is not Present.
    Log  ${count_pages}

Open Sign Up Page
    [Documentation]   This keyword will click on sign up link in conduit home page
    Wait For Elements State   selector=${sign_up_link}   state=visible
    Browser.Click   selector=${sign_up_link}

Open Sign In Page
    [Documentation]   This keyword will click on sign In link in conduit home page
    Wait For Elements State   selector=${sign_in_link}   state=visible
    Browser.Click   selector=${sign_in_link}

Open Settings Page
    [Documentation]   This keyword will open Settings page from home page
    Wait For Elements State   selector=${settings_txt_link}   state=visible
    Browser.Click   selector=${settings_txt_link}

Click On Global Feed
    [Documentation]   This keyword clicks on global feed text
    Wait For Elements State   selector=${global_feed_txt}   state=visible
    Browser.Click   selector=${global_feed_txt}

Get Signed In User Name
    [Documentation]   This keyword fetches the name of the user
    ${username}   Browser.Get Text  selector=${username_user_profile_txt}
    Set Test Variable   ${username}   ${username}






