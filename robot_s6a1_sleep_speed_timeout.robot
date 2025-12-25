*** Settings ***
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${URL}           https://demoqa.com/text-box
${BROWSER}       Chrome

*** Test Cases ***
Demonstrate Timing And Synchronization
    [Documentation]    Execution of Selenium Speed, Timeout, Implicit Wait, and Sleep.

    # --- STEP 1: INITIALIZE BROWSER ---
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # --- STEP 2: SET SELENIUM SPEED ---
    # This adds a 0.5s pause AFTER every command (click, input, etc.)
    # Useful for demos so the human eye can follow the script.
    Set Selenium Speed    0.5 seconds

    Input Text    id=userName    John Doe

    # --- STEP 3: SET SELENIUM TIMEOUT ---
    # This sets the global limit for "Wait Until..." keywords.
    # If the element doesn't appear in 10s, the test fails.
    Set Selenium Timeout    10 seconds
    Wait Until Element Is Visible    id=userEmail
    Input Text    id=userEmail    john@example.com

    # --- STEP 4: SET IMPLICIT WAIT ---
    # This tells Selenium to poll the DOM for a certain duration
    # before throwing a "NoSuchElementException".
    Set Selenium Implicit Wait    5 seconds
    Input Text    id=currentAddress    123 Robot Lane

    # --- STEP 5: ADD SLEEP ---
    # This is a hard-coded pause. The script stops entirely for 3 seconds.
    # Use this only when waiting for external animations or non-DOM events.
    Sleep    3 seconds

    Click Button    id=submit

    # Verification
    Element Should Be Visible    id=output