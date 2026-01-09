*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_URL}        https://www.automationexercise.com/
${PRODUCTS_URL}    https://www.automationexercise.com/products
${BROWSER}         chrome

*** Test Cases ***
Verify Browser Navigation History
    [Documentation]    Test case to navigate forward and backward and verify URLs.

    # 1. Open homepage
    Open Browser    ${HOME_URL}    ${BROWSER}
    Maximize Browser Window

    # 2. Use Get Location to retrieve current URL
    ${current_loc}=    Get Location
    Log To Console    Initial Location: ${current_loc}
    Should Be Equal    ${current_loc}    ${HOME_URL}

    # 3. Use Go To to navigate to the Products page
    Go To    ${PRODUCTS_URL}

    # 4. Wait for the Products page to load
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'All Products')]    timeout=10s
    ${prod_loc}=    Get Location
    Log To Console    Navigated To: ${prod_loc}

    # 5. Use Go Back to return to the homepage
    Go Back

    # 6. Verify that you are back on the homepage
    Wait Until Location Is    ${HOME_URL}
    ${final_loc}=    Get Location
    Log To Console    Returned To: ${final_loc}
    Should Be Equal    ${final_loc}    ${HOME_URL}

    [Teardown]    Close Browser