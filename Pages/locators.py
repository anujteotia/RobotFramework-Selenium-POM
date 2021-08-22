# common properties
browser = "chromium"
headless_driver = "False"
record_video = False
win_chrome_driver_exe = "${OUTPUTDIR}/WebDrivers/chromedriver.exe"
mac_chrome_driver_exe = "${OUTPUTDIR}/WebDrivers/chromedriver"
browser_timeout = "10s"
sleep_time = "5s"
set_selenium_speed = "0.5s"
auth_user = "candidatex"
auth_pwd = "qa-is-cool"
login_pwd = "qa-is-cool"
login_emailId = "newuser11@gmail.com"

# Home Page
site_url = "https://qa-task.backbasecloud.com"
basic_auth_user = "candidatex"
basic_auth_pwd = "qa-is-cool"
conduit_txt = "//h1[text()='conduit']"
homepage_tags = "//div[@class='tag-list']/a"
global_feed_txt = "//a[contains(text(),'Global Feed')]"
global_feed_articles = "//div[@class='article-preview']"
article_pagination = "//ul[@class='pagination']/li"
sign_in_link = "//a[contains(text(),'Sign in')]"
sign_up_link = "//a[contains(text(),'Sign up')]"
settings_txt_link = "//a[@href='/settings']"
author_name_global_feed = "(//a[@class='author'])["
article_preview_span = "(//a[@class='preview-link']/span)["

# Sign In Page
sign_in_email_txt_box = "//input[@placeholder='Email']"
sign_in_pwd_txt_box = "//input[@type='password']"
sign_in_btn = "//button[contains(text(),'Sign in')]"
sign_in_error_txt = "//ul[@class='error-messages']"

# Sign Up Page
username_txt_box = "//input[@placeholder='Username']"
email_txt_box = "//input[@placeholder='Email']"
pwd_txt_box = "//input[@placeholder='Password']"
sign_up_button = "//button[contains(text(),'Sign up')]"
sign_up_error_txt = "//ul[@class='error-messages']"
signed_up_username = "//a[@href='/profile/"

# User Home Page
new_article_txt = "//a[@href='/editor']"
username_txt_link = "(//a[@class='nav-link'])[3]"

# New Article page
publish_article_txt = "//button[contains(text(),'Publish Article')]"
article_title_txt_box = "//input[@formcontrolname='title']"
article_description_txt_box = "//input[@formcontrolname='description']"
article_body_txt_box = "//textarea[@formcontrolname='body']"
article_tags_txt_box = "//input[@placeholder='Enter tags']"

# Article Page
first_art_read_more_txt = "(//span[text()='Read more...'])[1]"
first_art_title = "(//a[@class='preview-link']//h1)[1]"
edit_article_txt_link = "(//a[contains(@class,'btn btn-sm')])[2]"
delete_article_txt_link = "(//button[contains(text(),'Delete Article')])[2]"
write_cmnt_txt_box = "//textarea[contains(@class,'form-control')]"
post_comment_button = "//button[contains(text(),'Post Comment')]"
updated_art_body_txt = "//div/p"
articles_list = "//app-profile-articles/app-article-list/app-article-preview"
follow_user_txt = "(//button[contains(@class,'btn btn-sm')])[2]"

# User Profile Page
user_profile_my_posts_txt = "//a[contains(text(),'My Posts')]"
user_profile_user_name = "(//a[@class='nav-link active'])[1]"
username_user_profile_txt = "(//a[@class='nav-link'])[3]"

# Settings Page
settings_title_txt = "//h1[text()='Your Settings']"