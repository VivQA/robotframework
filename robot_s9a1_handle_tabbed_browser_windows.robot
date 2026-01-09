*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://demo.automationtesting.in/Windows.html
${BROWSER}     chrome

*** Test Cases ***
Handle Tabbed Browser Windows
    [Documentation]    Test case to open a new window, switch to it, validate title, and return.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # 1. Click the "Open New Seperate Windows" tab/link
    # Note: On this site, the second tab option is labeled "Open New Seperate Windows"
    Click Element    xpath=//a[contains(text(), 'Open New Seperate Windows')]

    # 2. Click the "click" button to trigger the new window
    # This button is inside the specific tab pane
    Click Button     xpath=//div[@id='Seperate']/button

    # 3. Switch to the new window
    # 'NEW' is a reserved keyword in SeleniumLibrary to switch to the most recently opened window
    Switch Window    NEW

    # 4. Validate that the title of the new window contains "Selenium"
    ${new_title}=    Get Title
    Should Contain    ${new_title}    Selenium
    Log To Console    New Window Title: ${new_title}

    # 5. Switch back to the original window
    # 'MAIN' is a reserved keyword to switch back to the first window opened
    Switch Window    MAIN

    # 6. Validate original window title contains "Frames & windows" or "Windows"
    ${original_title}=    Get Title
    Should Contain Any    ${original_title}    Frames & windows    Windows
    Log To Console    Original Window Title: ${original_title}

    [Teardown]    Close All Browsers