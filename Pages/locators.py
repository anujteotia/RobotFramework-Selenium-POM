# common properties
browser = "chromium"
headless_driver = "False"
win_chrome_driver_exe = "${OUTPUTDIR}/WebDrivers/chromedriver.exe"
mac_chrome_driver_exe = "${OUTPUTDIR}/WebDrivers/chromedriver"
browser_timeout = "30s"
sleep_time = "5s"
set_selenium_speed = "0.5s"


# Home Page
site_url = "https://qa-task.backbasecloud.com"
basic_auth_user = "candidatex"
basic_auth_pwd = "qa-is-cool"
homepage_tags = "//div[@class='tag-list']/a"
global_feed_txt = "//a[contains(text(),'Global Feed')]"
global_feed_articles = "//div[@class='article-preview']"
article_pagination = "//ul[@class='pagination']/li"
sign_up_link = "//a[contains(text(),'Sign up')]"


# Sign Up Page
username_txt_box = "//input[@placeholder='Username']"
email_txt_box = "//input[@placeholder='Email']"
pwd_txt_box = "//input[@placeholder='Password']"
sign_up_button = "//button[contains(text(),'Sign up')]"