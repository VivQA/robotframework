*** Settings ***
Documentation     Scenario: Ensure login page title is correct and page is fully loaded.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.automationexercise.com/login
${EXPECTED_TITLE}  Automation Exercise - Signup / Login
${LOGIN_SECTION}  xpath://div[@class='login-form']

*** Test Cases ***
Verify Page Title And Load Status
    [Setup]    Open Browser To Website

    # 1. Check Page Title
    Title Should Be    ${EXPECTED_TITLE}

    # 2. Check Page Location (URL)
    Location Should Be    ${URL}

    # 3. Wait for Page Synchronization
    # Ensures the main container is rendered before we try to find inputs
    Wait Until Element Is Visible    ${LOGIN_SECTION}    timeout=10s

    # 4. Check Visibility of Header
    Page Should Contain    Login to your account

    Log    Page load verification successful.
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window