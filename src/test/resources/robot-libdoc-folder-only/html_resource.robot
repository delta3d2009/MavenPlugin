*** Settings ***
Documentation   A resource file containing the application specific keywords that create our own domain specific language. This resource implements keywords for testing HTML version of the test application. Keywords for Flex version are in flex_resource.txt and common_resource.txt is used to select which one to use.
Library         SeleniumLibrary

*** Variables ***
${LOGIN URL}  http://${SERVER}/html/
${WELCOME URL}  http://${SERVER}/html/welcome.html
${ERROR URL}  http://${SERVER}/html/error.html

*** Keywords ***
Open Browser To Login Page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Title Should Be  Login Page

Go To Login Page
    Go To  ${LOGIN URL}
    Title Should Be  Login Page

Input Username
    [Arguments]  ${username}
    Input Text  username_field  ${username}

Input Password
    [Arguments]  ${password}
    Input Text  password_field  ${password}

Submit Credentials
    Click Button  login_button

Welcome Page Should Be Open
    Location Should Be  ${WELCOME URL}
    Title Should Be  Welcome Page

Login Should Have Failed
    Location Should Be  ${ERROR URL}
    Title Should Be  Error Page
