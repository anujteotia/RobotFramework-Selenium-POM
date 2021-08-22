*** Settings ***
Resource            ./settings.robot
Suite Teardown      Close Browser   ALL
Force Tags          SETTINGS

*** Variables ***
${email_id}   candidatex@gmail.com
${password}   qa-is-cool

*** Test Cases ***
Validate Settings Page
    [Documentation]  This test case login using basic authentication and validates Home Page
    Given I Open '${site_url}' in '${browser}' Browser
    And Validate Title In Home Page
    When Open Sign In Page
    Then Validate Login Url
    And Enter Sign In Email Id   ${email_id}
    And Enter Sign In Password   ${password}
    Then Click Sign In Button
    And Verify Signed In
    Then Open Settings Page
    And Validate Settings Page Url
    And Validate Settings Title
