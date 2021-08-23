# Robot Framework (BDD) - Page Object Model Pattern - Python - Selenium - API - Gherkin
Gui Automation is acheived by using Browser library of Robot Framework. Page Object Model pattern is implemented considering Abstraction and extendability of the framework for long term. 
For API testing python requests library is used

## Prerequisites
Only Python 3.7 or newer is supported.

* Install `node.js` e.g. from https://nodejs.org/en/download/
* Update pip `pip install -U pip` to ensure latest version is used
* Install robotframework-browser and python requests from the commandline: `pip install robotframework-browser`
and `pip install requests`
* Install the node dependencies: run `rfbrowser init` in your shell

>if `rfbrowser` gives error, try `python -m Browser.entry init`

## Framework Functionalities And Other Information

* All the test cases are under `Tests/` directory
* All supporting Keywords are under `Resources` directory
* `Pages` directory contains a python file which contains configurations & all the xpaths required to navigate on GUI
* All the custom functions are present under `Libraries` directory
* `Manual Test Report` directory contains an excel file with Test cases, test case execution status and test evaluation report with suggestions, improvement ideas and bugs
* `Screenshots` directory will hold the screenshots in case of GUI test case failure. Failure screenshots will be named TEST_CASE_NAME-TIMESTAMP.png
* `Videos` directory is to store the execution video captured by the framework. This can toggeled from `locators.py` file by changing `record_video` parameter to `True/False`
