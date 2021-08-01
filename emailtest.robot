*** Settings ***
Library           SeleniumLibrary
Library           smtplib
Library           EmailMessage
Suite Teardown    Close Browser
*** Variables ***
${URL}    https://mail.google.com/
${BROWSER}  Chrome
*** Test Cases ***
Open email
    Open Chrome Browser To Login Email                  
    Input Email Address             ltchi23101999@gmail.com
    Submit Credentials
    Input Password                   n23t10n1999
    Submit Credentials
    Email Page Should Be Open
    # Input Subject                   This is my first Python email
    # Input Email Address Receive     ltchi23101999@gmail.com
    # Set Content                     And it actually works
    # Choose Attachment File 
    # Send email              
    Close Browser
*** Keywords ***
Wait And Click Element
    [Arguments]                                 ${locator}
    Wait Until Element Is Visible               ${locator}                                                                              ${timeout}
    Click Element                               ${locator}
Wait And Input Text
    [Arguments]                                 ${locator}                                                                              ${text}
    Wait Until Element Is Visible               ${locator}                                                                              ${timeout}
    SeleniumLibrary.Input Text                  ${locator}                                                                              ${text}
Wait And Select Frame
    [Arguments]                                 ${locator}
    Wait Until Element Is Visible               ${locator}                                                                              ${timeout}
    Select Frame                                ${locator}
Wait And Get Text From Element
    [Arguments]                                 ${locator}
    Wait Until Element Is Visible               ${locator}                                                                              ${timeout}
    ${text}=                                    SeleniumLibrary.Get Text                                                                ${locator}
    [Return]                                    ${text}
Wait And Count Element
    [Arguments]                                 ${locator}
    ${present}=                                 Run Keyword And Return Status                                                           Wait Until Element Is Visible                        ${locator}                ${timeout}
    ${count}=                                   Run Keyword If                                                                          ${present}                                           Get Element Count         ${locator}
    ...                                         ELSE                                                                                    Set Variable                                         0
    [Return]                                    ${count}
Open Chrome Browser
    Open Browser        ${URL}    ${BROWSER}
    Titil Should Be     Login Page
    
Input Email Address
    [Arguments]         ${email}
    Input Text          username_field    ${username}
Submit Credentials
    Click Button        email_button
Input Password
    [Arguments]         ${password}
    Input Text          password_field    ${password}
Submit Credentials
    Click Button        password_button
Welcome Page Should Be Open
    Title Should Be    Welcome Page
# *** Settings ***
# Library           SeleniumLibrary
# Library           HeadlessLibrary
# Library           OperatingLibrary
# Library           String
# Suite Teardown    Close Browser
# *** Variables ***
# ${url}        https://www.google.com.vn
# ${timeout}        15
# *** Test Cases ***
# Go To Gmail Testcase
#     Open Chrome Browser Custom                  about:blank
#     Maximize Browser Window
#     Go To 				${url}
# 	Sleep				5s
#     Input Text          https://mail.google.com/
#     Close Browser
# *** Keywords ***
# Wait And Click Element
#     [Arguments]                                 ${locator}
#     Wait Until Element Is Visible               ${locator}                                                                              ${timeout}
#     Click Element                               ${locator}
# Wait And Input Text
#     [Arguments]                                 ${locator}                                                                              ${text}
#     Wait Until Element Is Visible               ${locator}                                                                              ${timeout}
#     SeleniumLibrary.Input Text                  ${locator}                                                                              ${text}
# Wait And Select Frame
#     [Arguments]                                 ${locator}
#     Wait Until Element Is Visible               ${locator}                                                                              ${timeout}
#     Select Frame                                ${locator}
# Wait And Get Text From Element
#     [Arguments]                                 ${locator}
#     Wait Until Element Is Visible               ${locator}                                                                              ${timeout}
#     ${text}=                                    SeleniumLibrary.Get Text                                                                ${locator}
#     [Return]                                    ${text}
# Wait And Count Element
#     [Arguments]                                 ${locator}
#     ${present}=                                 Run Keyword And Return Status                                                           Wait Until Element Is Visible                        ${locator}                ${timeout}
#     ${count}=                                   Run Keyword If                                                                          ${present}                                           Get Element Count         ${locator}
#     ...                                         ELSE                                                                                    Set Variable                                         0
#     [Return]                                    ${count}

# Open Chrome Browser Custom
#     [Arguments]                                 ${urlPrm}
#     ${chrome options} =                         Evaluate                                                                                sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
#     Call Method                                 ${chrome options}                                                                       add_argument                                         disable-gpu
#     Call Method                                 ${chrome options}                                                                       add_argument                                         disable-infobars
#     ${options}=                                 Call Method                                                                             ${chrome options}                                    to_capabilities
#     Create Webdriver                            Chrome                                                                                  chrome_options=${chrome options}
#     Go to                                       ${urlPrm}
#     ${SL}                                       get library instance                                                                    SeleniumLibrary
#     ${webdriver}                                Call Method                                                                             ${SL}                                                _current_browser
