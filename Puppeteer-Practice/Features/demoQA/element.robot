*** Settings ***
Library    PuppeteerLibrary
Library    Dialogs

*** Variables ***
${TEXTBOX_URL}       https://demoqa.com/text-box
${CHECKBOX_URL}      https://demoqa.com/checkbox
${WEBTABLES_URL}     https://demoqa.com/webtables

*** Test Cases ***
Text Box
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${TEXTBOX_URL}    options=${options}
    Input Text    id:userName    Belle
    Input Text    id:userEmail    Belle12@email.com
    Input Text    id:currentAddress    25 Minburi 10511
    Input Text    id:permanentAddress    30 Ladkrabang 10621
    Click Button    id:submit
    Element Text Should Be    id:name    Name:Belle
    Element Text Should Be    id:email    Email:Belle12@email.com
    Element Text Should Be    css=#output #currentAddress    Current Address :25 Minburi 10511
    Element Text Should Be    css=#output #permanentAddress    Permananet Address :30 Ladkrabang 10621
    Close Browser

Check Box
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${CHECKBOX_URL}    options=${options}
    Click Button    css=[title="Expand all"]
    Click Element    css=[for="tree-node-commands"]
    Click Element    css=[for="tree-node-public"]
    Click Element    css=[for="tree-node-angular"]
    Click Element    css=[for="tree-node-wordFile"]
    ${text}=    Get Text    css=#result
    Should Match Regexp    ${text}    (?s).*commands.*angular.*public.*wordFile.*

Web Tables
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${WEBTABLES_URL}    options=${options}
    Click Button    id:addNewRecordButton
    Wait Until Page Contains    Registration Form
    Input Text    id:firstName    Belle
    Input Text    id:lastName    QAhive
    Input Text    id:userEmail    Tester@email.com
    Input Text    id:age    23
    Input Text    id:salary    20000
    Input Text    id:department    Legal
    Click Button    id:submit
    Wait Until Page Contains    Belle
    Input Text    id:searchBox    Belle
    Click Element    id:basic-addon2
    Click Element    css=[title="Edit"]
    Input Text    id:firstName    Bellatrix
    Click Button    id:submit
    Input Text    id:searchBox    Bellatrix
    Wait Until Page Contains    Bellatrix
    Click Element    css=[id="delete-record-4"]
    Wait Until Page Does Not Contains    Bellatrix
    Close Browser