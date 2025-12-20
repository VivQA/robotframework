*** Settings ***
Documentation     Scenario: Fill Account and Address Information to Create Account
Library           SeleniumLibrary

*** Variables ***
${BROWSER}           chrome
${URL}               https://www.automationexercise.com/login
# Locators - Account Info
${GENDER_MR}         id:id_gender1
${PASSWORD_FIELD}    id:password
${DAYS}              id:days
${MONTHS}            id:months
${YEARS}             id:years
${NEWSLETTER}        id:newsletter
${OPTIN}             id:optin
# Locators - Address Info
${FIRST_NAME}        id:first_name
${LAST_NAME}         id:last_name
${COMPANY}           id:company
${ADDRESS1}          id:address1
${COUNTRY}           id:country
${STATE}             id:state
${CITY}              id:city
${ZIPCODE}           id:zipcode
${MOBILE}            id:mobile_number
${CREATE_ACC_BTN}    xpath://button[@data-qa='create-account']
${SUCCESS_MSG}       xpath://b[contains(text(),'Account Created!')]

*** Test Cases ***
Complete Registration and Create Account
    [Setup]    Go To Signup Phase Two

    # Title and Password
    Select Radio Button    title    Mr.
    Input Text             ${PASSWORD_FIELD}    RobotPass123

    # Date of Birth
    Select From List By Value    ${DAYS}      15
    Select From List By Label    ${MONTHS}    May
    Select From List By Value    ${YEARS}     1990

    # Checkboxes
    Select Checkbox        ${NEWSLETTER}
    Select Checkbox        ${OPTIN}

    # Address Details
    Input Text             ${FIRST_NAME}    John
    Input Text             ${LAST_NAME}     Doe
    Input Text             ${COMPANY}       Tech Solutions
    Input Text             ${ADDRESS1}      123 Robot Street
    Select From List By Label    ${COUNTRY}    United States
    Input Text             ${STATE}         California
    Input Text             ${CITY}          Los Angeles
    Input Text             ${ZIPCODE}       90001
    Input Text             ${MOBILE}        1234567890

    # Submit
    Click Button           ${CREATE_ACC_BTN}

    # Verification
    Wait Until Element Is Visible    ${SUCCESS_MSG}    timeout=10s
    Element Should Contain           ${SUCCESS_MSG}    ACCOUNT CREATED!

    [Teardown]    Close Browser

*** Keywords ***
Go To Signup Phase Two
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text      xpath://input[@data-qa='signup-name']     John Doe
    Input Text      xpath://input[@data-qa='signup-email']    johndoe_${RANDOM_STRING}@test.com
    Click Button    xpath://button[@data-qa='signup-button']
    Wait Until Page Contains    Enter Account Information

# Helper to generate unique email to avoid "Email already exists" error
*** Variables ***
${RANDOM_STRING}    678910