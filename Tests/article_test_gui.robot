*** Settings ***
Resource            ./settings.robot
Suite Teardown      Close Browser   ALL
Force Tags          ARTICLES   GUI_TEST

*** Variables ***
${art_title}            Test
${art_description}      test
${art_body}             Test Article
${art_tag}              CRUD
${updated_txt}          Test Article updated

*** Test Cases ***
Create New Article
    [Documentation]  This test case login using basic authentication,validates Home Page and create & validates creation of new article
    Given I Open '${site_url}' in '${browser}' Browser
    And Validate Title In Home Page
    When Open Sign In Page
    Then Validate Login Url
    And Enter Sign In Email Id   ${login_emailId}
    And Enter Sign In Password   ${login_pwd}
    Then Click Sign In Button
    And Verify Signed In
    When Click On New Article Text
    And Validate New Article Page
    Then Enter Article Title   ${art_title}
    And Enter Article Description   ${art_description}
    And Write Article Body   ${art_body}
    And Enter Article Tag   ${art_tag}
    Then Click Publish Article Button
    And Verify Created Article Url   ${art_title}
    And Verify Edit Article Button
    And Verify Delete Article Button
    And Verify Comment Text Box
    And Verify Post Comment Button

Update Existing Article
    [Documentation]   This Test Case updates an existing article
    Given I Open '${site_url}' in '${browser}' Browser
    And Validate Title In Home Page
    When Open Sign In Page
    Then Validate Login Url
    And Enter Sign In Email Id   ${login_emailId}
    And Enter Sign In Password   ${login_pwd}
    Then Click Sign In Button
    And Verify Signed In
    Then Open User Profile
    And Get Logged In User Name
    And Validate User Profile Url
    Then Open My Posts
    And Read First Article From User Profile
    And Verify Created Article Url   ${art_title}
    Then And Verify Edit Article Button
    And Click On Edit Article Button
    Then Verify Edit Article Url   ${art_title}
    And Update Article Body   ${updated_txt}
    And Validate Updated Article   ${updated_txt}

Delete Existing Article
    [Documentation]  This test case deletes the existing article
    Given I Open '${site_url}' in '${browser}' Browser
    And Validate Title In Home Page
    When Open Sign In Page
    Then Validate Login Url
    And Enter Sign In Email Id   ${login_emailId}
    And Enter Sign In Password   ${login_pwd}
    Then Click Sign In Button
    And Verify Signed In
    Then Open User Profile
    And Get Logged In User Name
    And Validate User Profile Url
    Then Open My Posts
    And Check Count Of Articles
    And Read First Article From User Profile
    And Verify Created Article Url   ${art_title}
    Then Verify Delete Article Button
    And Click On Delete Article Button
    Then Open User Profile
    And Check Number Of Articles After Deletion

Delete Article Button Not Shown To Other Author
    [Documentation]   This test case checks Delete Article button shown to article's author
    [Tags]   TESTING
    Given I Open '${site_url}' in '${browser}' Browser
    And Validate Title In Home Page
    When Open Sign In Page
    Then Validate Login Url
    And Enter Sign In Email Id   ${login_emailId}
    And Enter Sign In Password   ${login_pwd}
    Then Click Sign In Button
    And Verify Signed In
    And Get Signed In User Name
    Then Click On Global Feed
    And Navigate To Other Author's Article
    And Validate Delete Article Option Is Not Available



