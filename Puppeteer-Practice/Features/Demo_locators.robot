*** Settings ***
Library    PuppeteerLibrary
Library    Dialogs

*** Test Cases ***
Demo ID Locators
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    http://127.0.0.1:7272/basic-html-elements.html    options=${options}
    Input Text    id:prop-visible    Hello World
    Dialogs.Pause Execution

Demo CSS Locators
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    http://127.0.0.1:7272/basic-html-elements.html    options=${options}
    Input Text    css:input#prop-visible    Hello World
    Dialogs.Pause Execution

Demo XPath Locators
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    http://127.0.0.1:7272/basic-html-elements.html    options=${options}
    Input Text    xpath:(//input)[1]    Hello World
    Dialogs.Pause Execution