*** Settings ***
Library           Collections
Library           ../Lib/PythonLibrary.py

*** Test Cases ***
Python test
    ${result}=    Add One    ${1}
    Should Be Equal    ${result}    ${2}
