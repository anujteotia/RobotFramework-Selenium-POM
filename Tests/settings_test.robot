*** Settings ***
Resource            ./settings.robot
Suite Teardown      Close Browser   ALL
Force Tags          SETTINGS   GUI_TEST

*** Test Cases ***
Validate Settings Page
    [Documentation]  This test case login using basic authentication and validates Home Page
    Given I Open '${site_url}' in '${browser}' Browser
    And Validate Title In Home Page
    When Open Sign In Page
    Then Validate Login Url
    And Enter Sign In Email Id   ${login_emailId}
    And Enter Sign In Password   ${login_pwd}
    Then Click Sign In Button
    And Verify Signed In
    Then Open Settings Page
    And Validate Settings Page Url
    And Validate Settings Title
