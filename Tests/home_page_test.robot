*** Settings ***
#Suite Teardown  Close All Browsers
Resource        ./settings.robot
Force Tags      HOME_PAGE

*** Test Cases ***
Validate Home Page
    [Documentation]  This test case validates Home Page
    Given I Open '${site_url}' in '${browser}' Browser