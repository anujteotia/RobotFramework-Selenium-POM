*** Settings ***
Resource            ./settings.robot
Force Tags          API_TEST

*** Variables ***
${limit}                10
${title}                Test
${description}          test
${body}                 Test Article
${taglist}              CRUD


*** Test Cases ***
Get List Of Articles
    [Documentation]  This test case will fetch ${limit} articles
    List Limited Articles   ${limit}   ${auth_user}   ${auth_pwd}
    Articles Ordered By Most Recent First

Create A New Article
    [Documentation]   This test case validates that the article is created successfully
    Create New Article   ${title}  ${description}  ${body}  ${taglist}  ${login_emailId}  ${login_pwd}  ${auth_user}  ${auth_pwd}
    Validate Created Article