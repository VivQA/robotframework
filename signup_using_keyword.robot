<<<<<<< HEAD
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://www.automationexercise.com/login
${BROWSER}         chrome
${NAME}            Vivek Test User
${EMAIL}           vivek_test_${12345}@gmail.com
${SIGNUP_NAME}     //input[@data-qa='signup-name']
${SIGNUP_EMAIL}    //input[@data-qa='signup-email']
${SIGNUP_BUTTON}   //button[@data-qa='signup-button']

*** Test Cases ***
robot_s2a2_signup_using_keyword
    [Documentation]    Scenario: Entering Name and Email for Signup using variables & keywords
    Open Login Page
    Enter Signup Details
    Click Signup Button
    Verify Signup Redirect

*** Keywords ***
Open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${SIGNUP_NAME}    timeout=10s

Enter Signup Details
    Input Text    ${SIGNUP_NAME}     ${NAME}
    Input Text    ${SIGNUP_EMAIL}    ${EMAIL}

Click Signup Button
    Click Button    ${SIGNUP_BUTTON}

Verify Signup Redirect
    Wait Until Page Contains    Enter Account Information    timeout=10s
    Page Should Contain         Enter Account Information
=======
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://www.automationexercise.com/login
${BROWSER}         chrome
${NAME}            Vivek Test User
${EMAIL}           vivek_test_${12345}@gmail.com
${SIGNUP_NAME}     //input[@data-qa='signup-name']
${SIGNUP_EMAIL}    //input[@data-qa='signup-email']
${SIGNUP_BUTTON}   //button[@data-qa='signup-button']

*** Test Cases ***
robot_s2a2_signup_using_keyword
    [Documentation]    Scenario: Entering Name and Email for Signup using variables & keywords
    Open Login Page
    Enter Signup Details
    Click Signup Button
    Verify Signup Redirect

*** Keywords ***
Open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${SIGNUP_NAME}    timeout=10s

Enter Signup Details
    Input Text    ${SIGNUP_NAME}     ${NAME}
    Input Text    ${SIGNUP_EMAIL}    ${EMAIL}

Click Signup Button
    Click Button    ${SIGNUP_BUTTON}

Verify Signup Redirect
    Wait Until Page Contains    Enter Account Information    timeout=10s
    Page Should Contain         Enter Account Information
>>>>>>> 1ff90b57cf7aa7d43cb28fe4d6cfef289b2249b3
