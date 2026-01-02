*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://demoqa.com/login
${BROWSER}       chrome

*** Test Cases ***
Open QA Demo in Multiple Browsers and Close All
    [Documentation]    Opens the QA Demo login page in two separate browser instances.

    # 1. Open the first Chrome instance
    Open Browser    ${URL}    ${BROWSER}    alias=qa_instance_1
    Maximize Browser Window
    Title Should Be    DEMOQA

    # 2. Open the second Chrome instance
    Open Browser    ${URL}    ${BROWSER}    alias=qa_instance_2
    Maximize Browser Window

    # 3. Wait for a few seconds to verify both are active
    Log To Console    Both browser instances are open.
    Sleep    5s

    # 4. Close all open browsers
    Close All Browsers
