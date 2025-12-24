*** Settings ***
Library    PuppeteerLibrary
Library    Dialogs

*** Variables ***
${LOGIN_URL}       http://127.0.0.1:7272/login-form-example.html

*** Test Cases ***
Valid Login
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${LOGIN_URL}    options=${options}
    Input Text    id:exampleInputEmail1    demo@qahive.com
    Input Text    id:exampleInputPassword1    123456789
    Click Element    id:exampleCheck1
    #ใต้คำสั่ง Asyne จะทำงานพร้อมกันหมด
    Run Async Keywords
    #เหมือน sleep ใน selenium
    ...    Wait For New Window Open    AND
    ...    Click Button    css:button.btn-primary
    #ให้ตัว test script ไปควบคุมตัวหน้าต่างใหม่ที่เปิดล่าสุด
    Switch Window    NEW
    Wait Until Page Contains    Welcome Page
    Close All Browser

Invalid Login
    &{options} =    Create Dictionary    headless=${False}
    Open Browser    ${LOGIN_URL}   options=${options}
    Input Text    id:exampleInputEmail1    demo@qahive.com
    #invalid password
    Input Text    id:exampleInputPassword1    45678
    Click Element    id:exampleCheck1
    Run Async Keywords
    ...    Wait For New Window Open    AND
    ...    Click Button    css:button.btn-primary
    Switch Window    NEW
    Wait Until Page Contains    Error Page
    Close All Browser
    
