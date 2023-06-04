*** Settings ***
Test Teardown     Close All Browsers
Force Tags        Templates
Test Template     Validate Page
Resource          ../Lib/Keywords.robot
Resource          ../Lib/GlobalVariables.robot

*** Test Cases ***    Page           Phrase                             Browser
Firefox ISTQB         ISTQB          Stowarzyszenie Jakości Systemów    Firefox

Chrome Aktualnosci    AKTUALNOŚCI    Informujemy, że                    Chrome

Firefox Fail          AKTUALNOŚCI    Zapraszamy na                      Firefox

*** Keywords ***
Validate Page
    [Arguments]    ${page}    ${phrase}    ${browser}
    Open Browser    ${ADDRESS}    browser=${browser}
    ${passed}    Run Keyword And Return Status    Wait Until Page Contains    ${phrase}    timeout=10s
    Run Keyword If    "${passed}" !="True"    Fail    Phrase "${phrase}" did not appear on the ${page}!. Please check settings.
