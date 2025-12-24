*** Settings ***
Library    PuppeteerLibrary
Library    Dialogs
Library    Collections
Library    XML

*** Variables ***
${AUTO_URL}       https://automationexercise.com/

*** Test Cases ***
Register User
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${AUTO_URL}    options=${options}
    Click Element    css=a[href="/login"]
    Wait Until Page Contains    New User Signup!
    Input Text     css=[data-qa="signup-name"]    Tester
    Input Text    css=[data-qa="signup-email"]    Test1221@email.com
    Click Button    css=[data-qa="signup-button"]
    Wait Until Page Contains    Enter Account Information
    Click Element    id:id_gender2
    Input Text    id:name    Tester
    Input Text    id:password    Test1214
    Select From List By Value    id:days    12
    Select From List By Value    id:months    2
    Select From List By Value    id:years    2018
    Click Element    id:newsletter
    Clear Element Text    id:optin
    Input Text    id:first_name    Linda
    Input Text    id:last_name    Gonzalez
    Input Text    id:company    QAhive
    Input Text    id:address1    30 NYC Main Street
    Input Text    id:address2    15 BKK Ladkrabang
    Select From List By Value    id:country    Canada
    Input Text    id:state    Canada
    Input Text    id:city    NYC
    Input Text    id:zipcode    21104
    Input Text    id:mobile_number    0123456789
    Click Button    css=[data-qa="create-account"]
    Wait Until Page Contains    Account Created!
    Click Button    css=[data-qa="continue-button"]
    Wait Until Page Contains Element    css=[href="/delete_account"]
    Click Element    css=[href="/delete_account"]
    Wait Until Page Contains    Account Deleted!
    Clear Element    css=[data-qa="continue-button"]
    Close Browser