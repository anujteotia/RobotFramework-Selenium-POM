*** Settings ***
Resource            ./settings.robot
Suite Teardown      Close Browser   ALL
Force Tags          REGISTER_USER   GUI_TEST

*** Test Cases ***
Register A User
    [Documentation]  This test case login using basic authentication and validates Home Page
    Given I Open '${site_url}' in '${browser}' Browser
    When Validate Title In Home Page
    And Open Sign Up Page
    Then Validate Register Url
    And Enter User Name
    And Enter Email Id
    And Enter Password   ${login_pwd}
    Then Click Sign Up Button
    And Verify Sign Up   ${login_username}


