*** Settings ***
Resource          ../Lib/Keywords.robot
Library           Collections
Library           DateTime

*** Variables ***
${TABLE}          xpath=//section[@id="main"]//table
@{MenuList}       O NAS    AKTUALNOŚCI    NASZE INICJATYWY    ISTQB®    IREB®    TMMI®    NASZE MEDIA    WSPÓŁPRACA









*** Test Cases ***
Get Menu
    [Tags]    Loop-1
    Open Browser    ${ADDRESS}
    ${menuText}=    Get WebElements    ${MMENU}
    FOR    ${item}    IN    @{menuText}
        Log    ${item.text}
    END
    Close Browser

If Test
    [Tags]    If-1
    ${Today}    DateTime.Get Current Date
    ${currentDate}    DateTime.Convert Date    ${Today}    result_format=epoch
    Open Browser with Chrome
    Click SubMenu    NASZE INICJATYWY    CHARYTATYWNE
    ${pageDate}=    Get Table Cell    ${TABLE}    -1    -1
    ${epoch_date}    Convert Date    ${pageDate}    epoch    date_format=%d.%m.%Y
    Comment    Date on page is    ${epoch_date}
    IF    '${pageDate}' < '${currentDate}'
        Log    Update data on the page    WARN
    ELSE
        Log    Good job!
    END
    Close Browser

Verify text in Menu
    [Tags]    Loop-2
    [Setup]    Open Browser With Chrome
    Menu Verification    ${MMENU}
    [Teardown]    Close Browser

*** Keywords ***
Menu Verification
    [Arguments]    ${locator}
    @{GetElement}=    Get WebElements    ${locator}
    @{menu}=    Create List
    FOR    ${element}    IN    @{GetElement}
        ${text}=    Get Text    ${element}
        Append To List    ${menu}    ${text}
    END
    Lists Should Be Equal    ${MenuList}    ${menu}
