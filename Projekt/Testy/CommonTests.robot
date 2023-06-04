*** Settings ***
Resource          ../Lib/Keywords.robot

*** Variables ***
${ElementToCheck}    xpath=//div[@class="square news"]/h2


*** Test Cases ***
Check Page Title
    [Tags]    CT-1    Critical
    [Setup]    Open Browser    ${ADDRESS}    ${BROWSER}
    Title Should Be    SJSI - polskie stowarzyszenie zrzeszające testerów i analityków wspierające środowisko IT
    [Teardown]    Close Browser

Check Page Title v2
    [Tags]    CT-2    Critical
    Check Title    SJSI - polskie stowarzyszenie zrzeszające testerów i analityków wspierające środowisko IT    ff
    [Teardown]    Close Browser

Check for Logo
    [Documentation]    Page dosen't have logo as image
    [Tags]    CT-3
    Open Browser with Chrome
    Page Should Contain Element    xpath://header/h1/a
    Open Browser with Firefox
    Page Should Contain Element    xpath://header/h1/a
    [Teardown]    Close All Browsers

Check Navigation Menu - Firefox
    [Tags]    CT-4
    [Setup]    Open Browser with Firefox
    Wait and Click Element    ${ElementToCheck}
    [Teardown]    Close Browser

Check Navigation Menu - Chrome
    [Tags]    CT-5
    Open Browser with Chrome
    Wait and Click Element    ${ElementToCheck}
    [Teardown]    Close Browser

Chceck Navigation Menu - Firefox And Chrome
    [Tags]    CT-6    Critical
    @{browsers}    Create List    Firefox    Chrome
    FOR    ${browser}    IN    @{browsers}
        Set Test Variable    ${BROWSER}    ${browser}
        Open Browser    ${ADDRESS}    browser=${browser}
        Wait and Click Element    ${ElementToCheck}
        Run Keyword If    "${browser}"=="Firefox"    Wait Until Page Contains    Informujemy, że na naszej
        Run Keyword If    "${browser}"=="Chrome"    Wait Until Page Contains    Informujemy, że na naszej
    END
    [Teardown]    Close All Browsers
