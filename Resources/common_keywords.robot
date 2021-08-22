*** Settings ***
Library     Browser   run_on_failure=Take ScreenShot On Failure
Library     DateTime
Library     String
Variables   ${OUTPUTDIR}/Pages/locators.py

*** Keywords ***
I Open '${url}' in '${browser}' Browser
    [Documentation]  This keyword opens given url in the browser of the choice.
    New Browser   browser=${browser}   headless=${headless_driver}   slowMo=1s
    Set Browser Timeout    ${browser_timeout}
    Run Keyword If   ${record_video}   New Context   httpCredentials={'username': '$basic_auth_user', 'password': '$basic_auth_pwd'}   recordVideo={"size": {"width": 1280, "height": 720}, "dir": "${OUTPUTDIR}/Videos"}
    ...   ELSE   New Context   httpCredentials={'username': '$basic_auth_user', 'password': '$basic_auth_pwd'}
    New Page   ${url}

Take ScreenShot On Failure
    [Documentation]   This Keyword will take the screenshot when the test fails
    ${time_stamp}   Get Current Date   exclude_millis=True
    ${test_name}   Replace String Using Regexp  ${TEST NAME}   \\s   -
    Take Screenshot   filename=${OUTPUTDIR}/Screenshots/${test_name}-${time_stamp}.png

Set Suite Variables
    [Documentation]   This keyword will set suite variables
    ${login_username}   Generate Random String    12    [LOWER]
    Set Suite Variable   ${LOGIN_USERNAME}   ${login_username}
    ${login_emailId}   Catenate   SEPARATOR=   ${login_username}   @gmail.com
    Set Suite Variable   ${LOGIN_EMAILID}   ${login_emailId}