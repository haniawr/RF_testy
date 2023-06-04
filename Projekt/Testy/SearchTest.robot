*** Settings ***
Suite Teardown    Close All Browsers
Resource          ../Lib/Keywords.robot

*** Variables ***
${Search}         xpath://nav//input[@type="search"]
${Submit}         xpath://nav//input[@type="submit"]

*** Test Cases ***
Search - Fail
    [Tags]    ST-1
    Open Browser with Firefox
    Wait Until Element Is Visible    ${Search}
    SearchResult    adres    Poznańska

Search - Pass
    [Tags]    ST-2
    Open Browser with Chrome
    Wait Until Element Is Visible    ${Search}
    SearchResult    kontakt    Poznańska

*** Keywords ***
SearchResult
    [Arguments]    ${searchterm}    ${result}
    Input Text    ${Search}    ${searchterm}
    Click Button    ${Submit}
    Wait Until Page Contains    ${result}    error=No ${result} found in search result.
