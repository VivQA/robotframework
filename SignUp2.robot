*** Settings ***
Documentation     Scenario: Entering Name and Email for Signup
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.automationexercise.com/login
${NAME_FIELD}     xpath://input[@data-qa='signup-name']
${EMAIL_FIELD}    xpath://input[@data-qa='signup-email']
${SIGNUP_BTN}     xpath://button[@data-qa='signup-button']
${USER_NAME}      John Doe
${USER_EMAIL}     johndoe_test123@example.com

*** Test Cases ***
New user enters name and email to begin the signup process
    [Setup]    Open Browser To Login Page
    Locate Signup Section
    Enter Name And Email    ${USER_NAME}    ${USER_EMAIL}
    Click Signup Button
    Verify Redirection To Account Information
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Automation Exercise - Signup / Login

Locate Signup Section
    Wait Until Element Is Visible    xpath://h2[contains(text(), 'New User Signup!')]
    Element Should Be Visible       ${NAME_FIELD}

Enter Name And Email
    [Arguments]    ${name}    ${email}
    Input Text     ${NAME_FIELD}     ${name}
    Input Text     ${EMAIL_FIELD}    ${email}

Click Signup Button
    Click Button    ${SIGNUP_BTN}

Verify Redirection To Account Information
    # Checking for the "Enter Account Information" header on the next page
    Wait Until Page Contains    Enter Account Information    timeout=10s
    Location Should Contain     /signup