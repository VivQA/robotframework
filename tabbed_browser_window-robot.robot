*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://demoqa.com/browser-windows
${BROWSER}     chrome

*** Test Cases ***
Handle DemoQA Browser Windows
    [Documentation]    Opens a new window on DemoQA, switches, and returns.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # 1. Click the 'New Window' button
    # The ID for this button on DemoQA is 'windowButton'
    Click Button    id=windowButton

    # 2. Switch to the newly opened window
    # 'NEW' is the easiest way to grab the most recent window/tab handle
    Switch Window    NEW

    # 3. Validate new window content
    # Note: DemoQA's new window usually contains a simple heading
    Wait Until Page Contains Element    id=sampleHeading
    ${text}=    Get Text    id=sampleHeading
    Log To Console    New Window Heading: ${text}
    Should Be Equal    ${text}    This is a sample page

    # 4. Switch back to the original window
    Switch Window    MAIN

    # 5. Validate original window by checking for the main header
    Element Text Should Be    class=main-header    Browser Windows
    Log To Console    Successfully returned to Main Window

    [Teardown]    Close All Browsers