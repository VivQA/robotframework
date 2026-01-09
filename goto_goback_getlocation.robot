*** Test Cases ***
    Navigation Test on DemoQA
    Open Browser    https://demoqa.com/    chrome
    Maximize Browser Window

    # Navigate to Elements page
    Go To    https://demoqa.com/elements

    # Go back to Homepage
    Go Back

    # Verification
    Location Should Be    https://demoqa.com/
    Close Browser