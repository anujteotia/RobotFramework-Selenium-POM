# common properties
browser = "chromium"
headless_driver = "False"
win_chrome_driver_exe = "${OUTPUTDIR}/WebDrivers/chromedriver.exe"
mac_chrome_driver_exe = "${OUTPUTDIR}/WebDrivers/chromedriver"
browser_timeout = "10s"
sleep_time = "5s"
set_selenium_speed = "0.5s"


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

# Sign In Page
sign_in_email_txt_box = "//input[@placeholder='Email']"
sign_in_pwd_txt_box = "//input[@type='password']"
sign_in_btn = "//button[contains(text(),'Sign in')]"
new_article_txt = "//a[@href='/editor']"
sign_in_error_txt = "//ul[@class='error-messages']"

# Sign Up Page
username_txt_box = "//input[@placeholder='Username']"
email_txt_box = "//input[@placeholder='Email']"
pwd_txt_box = "//input[@placeholder='Password']"
sign_up_button = "//button[contains(text(),'Sign up')]"
sign_up_error_txt = "//ul[@class='error-messages']"
signed_up_username = "//a[@href='/profile/"