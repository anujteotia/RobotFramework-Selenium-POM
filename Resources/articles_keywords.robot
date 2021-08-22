*** Settings ***
Library    String
Library    Collections
Library    DateTime
Library    ${OUTPUTDIR}/Libraries/Articles.py
Variables   ${OUTPUTDIR}/Pages/locators.py

*** Keywords ***
Click On New Article Text
    [Documentation]   This keyword clicks on new article link in signed in page
    Browser.Click   selector=${new_article_txt}

Validate New Article Page
    [Documentation]   This keyword verifies that page to create new article is open
    Browser.Get Url   assertion_operator=should end with  assertion_expected=editor   message=New article page url is not loaded
    Wait For Elements State   selector=${publish_article_txt}   state=visible

Enter Article Title
    [Documentation]  This keyword enter title for the article
    [Arguments]   ${title}
    Fill Text   selector=${article_title_txt_box}   txt=${title}

Enter Article Description
    [Documentation]  This keyword enter description for article
    [Arguments]   ${description}
    Fill Text   selector=${article_description_txt_box}   txt=${description}

Write Article Body
    [Documentation]  This keyword enter text in article body
    [Arguments]   ${body_txt}
    Fill Text   selector=${article_body_txt_box}   txt=${body_txt}

Enter Article Tag
    [Documentation]  This keyword enter tags for the article
    [Arguments]   ${tag}
    Fill Text   selector=${article_tags_txt_box}   txt=${tag}
    Keyboard Key    press    Enter

Click Publish Article Button
    [Documentation]  This keyword clicks on the publish article button
    Browser.Click   selector=${publish_article_txt}

Verify Created Article Url
    [Documentation]  This keyword checks the website is navigated to correct url
    [Arguments]   ${article_title}
    ${article_title}    Convert To Lower Case   ${article_title}
    Browser.Get Url   assertion_operator=contains  assertion_expected=article/${article_title}   message=Navigation unsuccessful to article

Verify Edit Article Button
    [Documentation]   This keyword validates the presence of Edit Article button
    Wait For Elements State   selector=${edit_article_txt_link}   state=visible
    ${edit_article}   Browser.Get Text   selector=${edit_article_txt_link}  assertion_operator=contains  assertion_expected=Edit Article
    ...   message=Edit Article button is not present

Click On Edit Article Button
    [Documentation]   This keywor clicks on Edit Article Button
    Browser.Click   selector=${edit_article_txt_link}

Verify Delete Article Button
    [Documentation]   This keyword validates the presence of Delete Article button
    Wait For Elements State   selector=${delete_article_txt_link}   state=visible
    ${delete_article}   Browser.Get Text   selector=${delete_article_txt_link}  assertion_operator=contains  assertion_expected=Delete Article
    ...   message=Delete Article button is not present

Click On Delete Article Button
    [Documentation]   This keywor clicks on Delete Article Button
    Browser.Click   selector=${delete_article_txt_link}

Verify Comment Text Box
    [Documentation]   This keyword validates the presence of comment text box
    Wait For Elements State   selector=${write_cmnt_txt_box}   state=visible

Verify Post Comment Button
    [Documentation]   This keyword validates the presence of post comment button
    Wait For Elements State   selector=${post_comment_button}   state=visible
    ${post_comment}   Browser.Get Text   selector=${post_comment_button}  assertion_operator=contains  assertion_expected=Post Comment
    ...   message=Post Comment button is not present

Click On Post Comment Button
    [Documentation]   This keywor clicks on Post Comment Button
    Browser.Click   selector=${post_comment_button}

Read First Article From User Profile
    [Documentation]   This keyword Open first existing article
    ${art_title}   Browser.Get Text   selector=${first_art_title}
    Browser.Click   selector=${first_art_read_more_txt}

Verify Edit Article Url
    [Documentation]   This keyword verifies that we are on Edit Article page
    [Arguments]   ${article_title}
    ${article_title}    Convert To Lower Case   ${article_title}
    Browser.Get Url   assertion_operator=contains  assertion_expected=editor/${article_title}   message=Navigation unsuccessful to edit article

Update Article Body
    [Documentation]   This keyword update body of the article
    [Arguments]   ${updated_txt}
    Browser.Clear Text   selector=${article_body_txt_box}
    Browser.Fill Text   selector=${article_body_txt_box}   txt=${updated_txt}
    Click Publish Article Button

Validate Updated Article
    [Documentation]   This keyword validates that the article has been updated correctly
    [Arguments]   ${updated_txt}
    Browser.Get Text   selector=${updated_art_body_txt}   assertion_operator=equal  assertion_expected=${updated_txt}
    ...   message=Unable to Update article

Check Count Of Articles
    [Documentation]   This keyword checks the count of Articles
    ${article_count}   Browser.Get Element Count   selector=${articles_list}
    Set Test Variable   ${article_count}   ${article_count}

Check Number Of Articles After Deletion
    [Documentation]   his keyword verifies that the count of articles reduced by after after deleting an article
    ${count_after_del}   Evaluate   ${article_count}-1
    ${article_count_After_del}   Browser.Get Element Count   selector=${articles_list}   assertion_operator=equal
    ...   expected_value=${count_after_del}   message=Unable to delete the Articles.

Navigate To Other Author's Article
    [Documentation]   This keyword navigates to the article from other user
    FOR  ${index}   IN RANGE   1  11
       ${author}   Catenate   SEPARATOR=   ${author_name_global_feed}   ${index}]
       ${author_txt}   Browser.Get Text   selector=${author}
       ${art_preview}   Catenate   SEPARATOR=   ${article_preview_span}   ${index}]
       Run Keyword If   '${author_txt}'!='${username}'   Run Keywords   Hover   selector=${art_preview}   AND   Browser.Click  selector=${art_preview}
       Exit For Loop If   '${author_txt}'!='${username}'
    END

Validate Delete Article Option Is Not Available
    [Documentation]   This keyword validates that delete article option is not available for other users
    Browser.Get Url   assertion_operator=contains  assertion_expected=article/   message=Navigation unsuccessful to article
    Browser.Get Text   selector=${follow_user_txt}  assertion_operator=contains  assertion_expected=Follow
    ...   message=Follow User button is not present
    Browser.Get Element State   selector=${delete_article_txt_link}  state=visible   assertion_operator=should be   assertion_expected=None
    ...   message=Other user can also delete the article

List Limited Articles
    [Documentation]   This Keyword will return a number of articles
    [Arguments]   ${limit}   ${auth_user}   ${auth_pwd}
    ${list_articles}   List Articles   ${limit}   ${auth_user}   ${auth_pwd}
    Set Test Variable   ${list_articles}   ${list_articles}
    Length Should Be   item=${list_articles['articles']}   length=${limit}   msg=Articles are not returned correctly

Articles Ordered By Most Recent First
    [Documentation]   This keyword validates that articles are oredred by most recent first
    ${list_length}   Get Length   ${list_articles['articles']}
    ${latest_art_date}   Set Variable   ${list_articles['articles'][0]['createdAt']}
    FOR   ${index}   IN RANGE   1   ${list_length}
        ${date_created}   Set Variable   ${list_articles['articles'][${index}]['createdAt']}
        ${date}   Subtract Date From Date   ${latest_art_date}   ${date_created}
        Should Be True   ${date}>0
        ${latest_art_date}   Set Variable   ${date_created}
    END

Create New Article
    [Documentation]   This keyword creates a new article
    [Arguments]   ${title}  ${description}  ${body}  ${taglist}  ${email}  ${password}  ${auth_user}  ${auth_pwd}
    ${article_data}   Create Article   ${title}  ${description}  ${body}  ${taglist}  ${email}  ${password}  ${auth_user}  ${auth_pwd}
    Set Test Variable   ${article_data}   ${article_data}

Validate Created Article
    [Documentation]   This keyword validates the content of article created
    Dictionary Should Contain Key   dictionary=${article_data['article']}   key=title   msg=title is not present for new article created
    Dictionary Should Contain Key   dictionary=${article_data['article']}   key=description   msg=title is not present for new article created
    Dictionary Should Contain Key   dictionary=${article_data['article']}   key=body   msg=title is not present for new article created
    Dictionary Should Contain Key   dictionary=${article_data['article']}   key=tagList   msg=title is not present for new article created

