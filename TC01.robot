*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}               https://www.automationexercise.com/login
${BROWSER}           chrome

${NAME_FIELD}        //*[@data-qa="signup-name"]
${EMAIL_FIELD}       //*[@data-qa="signup-email"]
${SIGNUP_BUTTON}     //*[@data-qa="signup-button"]

*** Test Cases ***
robot_s2a1_signup
    [Documentation]    New user enters name and email to begin the signup process.
    [Tags]    signup    s2a1

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible    ${NAME_FIELD}    10s
    Wait Until Element Is Visible    ${EMAIL_FIELD}    10s

    Input Text    ${NAME_FIELD}    Vivek Test User
    Input Text    ${EMAIL_FIELD}   vivek.test.user@example.com

    Click Button    ${SIGNUP_BUTTON}

    Wait Until Page Contains Element    //*[@data-qa="title"]    10s

    Page Should Contain Element    //*[@data-qa="title"]
    Close Browser
