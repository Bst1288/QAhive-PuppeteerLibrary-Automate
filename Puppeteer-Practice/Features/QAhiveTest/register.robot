*** Settings ***
Library    PuppeteerLibrary
Library    Dialogs

*** Variables ***
${REGISTER_URL}       https://web-demo.qahive.com/e-commerce/register

*** Test Cases ***
Register New Account
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${REGISTER_URL}    options=${options}
    Click Button    css=[data-testid="loginLink"]
    Input Text    css=input[data-testid="email"]    Test1216@email.com
    Input Text    css=input[data-testid="password"]    Test12345
    Input Text    css=input[data-testid="name"]    TestUser
    Click Element    css=input[data-testid="female"]
    Click Button    css=[data-testid="submit"]
    Click Button    css=[data-testid="submit"]
    Wait Until Page Contains    dashboard