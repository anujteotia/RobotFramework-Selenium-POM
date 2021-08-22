*** Settings ***
Resource            ./settings.robot
Force Tags          API_TEST

*** Test Cases ***
Get List Of Tags
    [Documentation]  This test case will fetch the list of tags
    Fetch All Tags   ${auth_user}  ${auth_pwd}