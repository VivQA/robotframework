*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://demo.automationtesting.in/Alerts.html
${BROWSER}         chrome

*** Test Cases ***
Scenario 1: Alert with OK
    [Documentation]    Handles a basic JavaScript alert by clicking OK.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Navigate to the correct tab (usually default, but good to be explicit)
    Click Element    xpath=//a[@href='#OKTab']

    # Click button to trigger alert
    Click Button     xpath=//button[contains(text(),'alert box:')]

    # Handle the alert (Default action is ACCEPT)
    Handle Alert     action=ACCEPT    timeout=5s

    # Validation: Ensure the alert is gone and no error occurs
    Element Should Be Visible    xpath=//a[@href='#OKTab']
    [Teardown]    Close Browser

Scenario 2: Alert with OK & Cancel
    [Documentation]    Handles a confirmation alert by clicking Cancel and verifying text.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Click the "Alert with OK & Cancel" tab
    Click Element    xpath=//a[@href='#CancelTab']

    # Click button to trigger the confirmation box
    Click Button     xpath=//button[contains(text(),'confirm box')]

    # Handle the alert by choosing DISMISS (Cancel)
    Handle Alert     action=DISMISS

    # Verify the confirmation message appears
    Element Text Should Be    id=demo    You Pressed Cancel

    [Teardown]    Close Browser