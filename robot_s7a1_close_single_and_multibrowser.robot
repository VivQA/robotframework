*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.automationexercise.com/login

*** Test Cases ***
Open Link in Multiple Browsers and Close All
    [Documentation]    Opens the URL in two separate Chrome instances and then closes both.

    # 1. Open Chrome browser and go to the URL
    Open Browser    ${URL}    chrome    alias=browser1
    Maximize Browser Window

    # 2. Open the same link in a second Chrome browser
    Open Browser    ${URL}    chrome    alias=browser2
    Maximize Browser Window

    # 3. Wait for a few seconds
    Sleep    3s

    # 4. Close all open browsers
    Close All Browsers