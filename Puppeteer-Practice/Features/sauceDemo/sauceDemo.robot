*** Settings ***
Library    PuppeteerLibrary
Library    Dialogs
Library    XML

*** Variables ***
${LOGIN_URL}       https://www.saucedemo.com/v1/index.html

*** Keywords ***
Login with standard user
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${LOGIN_URL}    options=${options}
    Wait Until Element Is Visible    css=.login_logo
    Input Text    id:user-name    standard_user
    Input Text    id:password    secret_sauce
    Run Async Keywords
    ...    Wait For Navigation    AND
    ...    Click Element    id:login-button
    Wait Until Page Contains Element    css=[src="./img/bike-light-1200x1500.jpg"]

*** Test Cases ***
Login with standard user
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${LOGIN_URL}    options=${options}
    Wait Until Element Is Visible    css=.login_logo
    Input Text    id:user-name    standard_user
    Input Text    id:password    secret_sauce
    Run Async Keywords
    ...    Wait For Navigation    AND
    ...    Click Element    id:login-button
    Wait Until Page Contains Element    css=[src="./img/bike-light-1200x1500.jpg"]
    Close Browser

Login with locked out user
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${LOGIN_URL}    options=${options}
    Wait Until Element Is Visible    css=.login_logo
    Input Text    id:user-name    locked_out_user
    Input Text    id:password    secret_sauce
    Click Element    id:login-button
    Wait Until Page Contains    Sorry, this user has been locked out.
    Close Browser

Login with problem user
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${LOGIN_URL}    options=${options}
    Wait Until Element Is Visible    css=.login_logo
    Input Text    id:user-name    problem_user
    Input Text    id:password    secret_sauce
    Run Async Keywords
    ...    Wait For Navigation    AND
    ...    Click Element    id:login-button
    Wait Until Page Contains Element    css=[src="./img/bike-light-1200x1500.jpgWithGarbageOnItToBreakTheUrl"]
    Close Browser

Add to card and check out
    Login with standard user
    Wait Until Page Contains    Sauce Labs Backpack
    Click Element    xpath=//div[text()="Sauce Labs Backpack"]
    Wait Until Page Contains    29.99
    Click Button    xpath=//button[text()="ADD TO CART"]
    Element Should Contain    css=span.shopping_cart_badge    1
    Click Element    css=[data-icon="shopping-cart"]
    Wait Until Page Contains    Sauce Labs Backpack
    Click Element    css:.checkout_button
    Wait Until Page Contains    Checkout: Your Information
    Input Text    id:first-name    Tester
    Input Text    id:last-name    QAhive
    Input Password    id:postal-code    10510
    Click Element    css:input.btn_primary.cart_button
    Wait Until Page Contains    Checkout: Overview
    PuppeteerLibrary.Element Text Should Be    css:div.summary_subtotal_label    Item total: $29.99
    PuppeteerLibrary.Element Text Should Be    css:div.summary_tax_label         Tax: $2.40
    PuppeteerLibrary.Element Text Should Be    css:div.summary_total_label       Total: $32.39
    Click Element    xpath=//a[text()="FINISH"]
    Wait Until Page Contains    Finish
    Close Browser