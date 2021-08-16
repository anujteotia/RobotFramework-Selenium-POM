*** Settings ***
Resource        ./settings.robot
Force Tags      HOME_PAGE

*** Variables ***
${username}   new_user123
${email_id}   candidatex@gmail.com
${password}   qa-is-cool

*** Test Cases ***
Register A User
    [Documentation]  This test case login using basic authentication and validates Home Page
    Given I Open '${site_url}' in '${browser}' Browser
    When Validate Title In Home Page
    And Open Sign Up Page
    Then Validate Register Url
    And Enter User Name   ${username}
    And Enter Email Id   ${email_id}
    And Enter Password   ${password}
    Then Click Sign Up Button
    Sleep  5s

