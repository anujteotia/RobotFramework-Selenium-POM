*** Settings ***
Variables   ${OUTPUTDIR}/Pages/locators.py

*** Keywords ***
Validate Settings Page Url
    [Documentation]   This keyword validates the url of settings page
    Browser.Get Url  assertion_operator=should end with  assertion_expected=settings  message=Unable to open settings page.

Validate Settings Title
    [Documentation]   This keyword validates title of the Settings page
    Browser.Get Text   selector=${settings_title_txt}  assertion_operator=should be  assertion_expected=Your Settings  message=Unable to open Settings Page.






