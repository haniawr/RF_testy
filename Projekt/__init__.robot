*** Settings ***
Suite Setup       Init Setup
Suite Teardown    Init Teardown
Library           Selenium2Library

*** Keywords ***
Init Setup
    Log    Hello! Have a nice day!

Init Teardown
    Log    Goodbye! Thank you for great work!
    Close All Browsers
