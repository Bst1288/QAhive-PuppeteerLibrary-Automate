*** Settings ***
Library    PuppeteerLibrary
Library    Dialogs

*** Variables ***
${REGIS_URL}       http://127.0.0.1:7272/register-form-example.html

*** Test Cases ***
Register Test
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${REGIS_URL}    options=${options}
    Input Text    id:inputEmail4    demo@qahive.com
    Input Text    id:inputPassword4    123456789
    Input Text    id:inputAddress    255 Minburi
    Input Text    id:inputAddress2    45 Ladkrabang
    Input Text    id:inputCity    BKK
    Select From List By Value    id:inputState    1
    Input Text    id:inputZip    10152
    Click Button    css=button[type="submit"]
    Close Browser