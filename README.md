# Robot Framework (BDD) - Page Object Model Pattern - Python - Selenium - API - Gherkin
Gui Automation is acheived by using Browser library of Robot Framework. Page Object Model pattern is implemented considering Abstraction and extendability of the framework for long term. 
For API testing python requests library is used

## Prerequisites
Only Python 3.7 or newer is supported.

* Install `node.js` e.g. from https://nodejs.org/en/download/
* Update pip `pip install -U pip` to ensure latest version is used
* Install robotframework-browser and python requests from the commandline: `pip install robotframework-browser`
and `pip install requests`
* Install the node dependencies: run `rfbrowser init`

>if `rfbrowser` gives error, try `python -m Browser.entry init`

## Framework Functionalities And Other Information

* `Tests/` directory contains all the test cases for GUI and API
* `Resources` directory contains all supporting Keywords.
* `Pages` directory contains a python file which contains configurations & all the xpaths required to navigate on GUI
* `Libraries` directory holds all the custom python libraries mainly for API automation
* `Manual Test Report` directory contains an excel file with Test cases, test case execution status and test evaluation report with suggestions, improvement ideas and bugs
* `Screenshots` directory will hold the screenshots in case of GUI test case failure. Failure screenshots will be named TEST-CASE-NAME-TIME-STAMP.png
* `Videos` directory is to store the execution video captured by the framework. This can toggeled from `locators.py` file by changing `record_video` parameter to `True/False`

### Highlights
* Supported Browsers 

Browsers can be switched by changing the value of `browser` parameter under `common properties` section of `Pages/locators.py` file
```
chromium - Google Chrome, Microsoft Edge (since 2020), Opera
firefox	- Mozilla Firefox
webkit	- Apple Safari, Mail, AppStore on MacOS and iOS
```

* Screenshots 

In case of test case failure, a screenshot will be captured of the current screen and stored in `Screenshots` directory. Nomenclature followed: TEST-CASE-NAME-TIME-STAMP.png

* Automatic Test Report

An automatic test report will be generated after every test run. Report and Log file can be found in project root directory by the name of `report.html` & `log.html`

* Record Video

This framework has capability to record the video of automated test case execution by toggeling `record_video` parameter of `Pages/locators.py` file. False: No video will be captured, True: Video will be captured for every test executed and will be stored in `Videos` directory.

* Headless Execution

Execution can easily be switched to headless by changing the value of `headless_driver` parameter in `Pages/locators.py` file.

## Jenkins Job

Jenkins jobs are created on both windows and macOS and are exported to the project root directory by the name of `jenkins_job_windows.xml` and `jenkins_job_mac.xml` respectively.

Follow the below steps to import the jenkins job:

### Prerequisites: 
Jenkins with `Nodejs` and `Robot Framework` plugins installed & Access token authenticated git access. 

* Open Jenkins Cli from Jenkins > Manage Jenkins > Jenkins CLI
* Download jenkins-cli.jar and run it
* Execute below-mentioned command to import the job into Jenkins
```
java -jar jenkins-cli.jar -s <your server url> -auth username:password get-job <JOB NAME> > <JOB_NAME.xml>
```
* Goto Jenkins Dashboard job and configure the below:
    * Update git credentials
    * Install and configure NodeJs plugin (Refer screenshot `Jenkins_nodejs_job_conf.png` in project root directory)
    * Configure robot framework plugin in post build actions (Refer screenshot `robot_plugin.png` in project root directory)

> If multiple versions of python are installed on your system please replace `python` with `python3` in all instances. And If you have only one version of python then keep `python` instead `python3` at all instances. 

* Navigate to job and select Build now.
## How To Execute Test Cases - Locally

```
git clone https://github.com/anujteotia/assignment-rf-selenium-pom.git
cd into/project_root_directory
robot Tests/
```
* Only API test cases can also be executed by running `robot -i API_TEST Tests/` command from project root directory
* Same way only GUI test cases can also be executed by running `robot -i GUI_TEST Tests/` command from project root directory

> After every execution a test report and log file will be generated under project root directory by the name of `report.html` & `log.html`


<h1 align="center">THE END</h1>                                                
