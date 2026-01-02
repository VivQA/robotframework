*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://demoqa.com/alerts
${BROWSER}     chrome

*** Test Cases ***
Scenario 1: Alert with OK
    [Documentation]    Triggers a simple alert and accepts it.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Click the button for a simple alert
    Click Button    id=alertButton

    # Verify alert text and Accept (OK)
    ${message}=    Handle Alert    action=ACCEPT
    Log To Console    Alert says: ${message}

    [Teardown]    Close Browser

Scenario 2: Alert with OK & Cancel
    [Documentation]    Triggers a confirm box, cancels it, and verifies the result text.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Scroll down to ensure the button is clickable
    Execute Javascript    window.scrollTo(0, 200)

    # Click the button for a confirm box
    Click Button    id=confirmButton

    # Dismiss the alert (Cancel)
    Handle Alert    action=DISMISS

    # Validate the confirmation message on the page
    Element Text Should Be    id=confirmResult    You selected Cancel

    [Teardown]    Close Browser