*** Settings ***
Test Teardown     Close All Browsers
Force Tags        BddTests
Resource          ../Lib/Keywords.robot

*** Test Cases ***
Chrome Aktualnosci
    Given Homepage has been opened with "Chrome"
    When User clicks "AKTUALNOŚCI"
    Then "Informujemy, że na naszej" phrase appears

Firefox Wspolpraca
    Given Homepage has been opened with "Firefox"
    When User clicks "WSPÓŁPRACA"
    Then "Zapraszamy na podstrony" phrase appears

*** Keywords ***
Homepage has been opened with "${browser}"
    Open Browser    ${ADDRESS}    browser=${browser}
    Set Test Variable    ${BROWSER}    ${browser}

User clicks "${button}"
    Run Keyword If    "${BROWSER}"=="Firefox"    Wait and Click Main Menu Button By Text    ${button}
    Run Keyword If    "${BROWSER}"=="Chrome"    Wait and Click Main Menu Button By Text    ${button}

"${phrase}" phrase appears
    Wait Until Page Contains    ${phrase}    timeout=10s
