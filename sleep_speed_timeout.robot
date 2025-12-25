*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://demoqa.com/text-box
${BROWSER}      Chrome
${FULL_NAME}    John Doe

*** Test Cases ***
Demonstrate Selenium Timing Controls
    [Documentation]    Showcases Speed, Timeout, Implicit Wait, and Sleep.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # 1. SELENIUM SPEED
    # Sets a delay after every single Selenium command. Great for visual debugging.
    Set Selenium Speed    0.5 seconds
    Input Text    id=userName    ${FULL_NAME}

    # 2. SELENIUM TIMEOUT
    # Sets the maximum time to wait for "Wait Until..." keywords before failing.
    Set Selenium Timeout    10 seconds
    Wait Until Element Is Visible    id=submit    # Will wait up to 10s

    # 3. IMPLICIT WAIT
    # A global poll: if an element isn't found immediately, Selenium retries until this time expires.
    Set Selenium Implicit Wait    5 seconds
    Input Text    id=userEmail    john@example.com

    # 4. SLEEP
    # A hard pause. Execution stops completely for exactly this amount of time.
    # Use sparingly as it makes tests slow and "brittle."
    Sleep    2 seconds

    Click Button    id=submit

    [Teardown]    Close Browser