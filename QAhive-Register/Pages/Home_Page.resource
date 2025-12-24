*** Settings ***
Library    PuppeteerLibrary

*** Variables ***
${Home_Page.Unique page identifier}    id=hplogo


*** Keywords ***
Wait for page load
  PuppeteerLibrary.Wait Until Page Contains Element   ${Home_Page.Unique page identifier}
