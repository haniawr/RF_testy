*** Settings ***
Documentation     *Dictionary tests*
Library           Collections

*** Variables ***
@{list_no}        one    two    three    four
&{dict}           apple=jablko    pear=gruszka    strawberry=truskawka








*** Test Cases ***
List
    Log List    ${list_no}    trace
    Log    ${list_no}[-1]    warn

Dictionary
    Log Dictionary    ${dict}
    Set To Dictionary    ${dict}    orange=pomarancza
    Dictionary Should Not Contain Key    ${dict}    gruszka    warn
    ${value}=    Get From Dictionary    ${dict}    apple
    FOR    ${item}    IN    @{dict}
        Log    ${dict}[${item}]    error
    END
