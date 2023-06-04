*** Settings ***
Library           Selenium2Library
Resource          ./GlobalVariables.robot

*** Keywords ***
Open Browser with Firefox
    Open Browser    ${ADDRESS}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${IMAGE}    ${TIMEOUT}

Open Browser with Chrome
    Open Browser    ${ADDRESS}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${IMAGE}    ${TIMEOUT}

Check Title
    [Arguments]    ${title}    ${browser}
    [Documentation]    Checks title of the page
    Open Browser    ${ADDRESS}    browser=${browser}
    Title Should Be    ${title}

Wait and Click Element
    [Arguments]    ${locator}
    [Documentation]    Wait for 10 s and clicks on element indicated by _locator_ variable
    Wait Until Keyword Succeeds    10    0.1    Click Element    ${locator}

Wait and Click Main Menu Button By Text
    [Arguments]    ${text}
    ${xpath}    Set Variable    xpath=//ul[@id="menu-glowne-menu"]/li//a[text()="${text}"]
    Wait and Click Element    ${xpath}

Click SubMenu
    [Arguments]    ${text}    ${text2}
    Mouse Over    xpath=//ul[@id="menu-glowne-menu"]/li//a[text()="${text}"]
    Wait Until Element Is Visible    xpath=//ul[@id="menu-glowne-menu"]//a[text()="${text2}"]    10s
    Click Link    xpath=//ul[@id="menu-glowne-menu"]/li//a[text()="${text2}"]
