*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://product.d.tlogical.com/
${BROWSER}    chrome


*** Keywords ***
Start on Webpage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    T.Logical Resolution
    Wait Until Element Is Visible    id=section-1
    FOR    ${i}    IN RANGE    1    4
        Element Should Be Visible    id=section-${i}
    END

Start Login
    Start on Webpage
    Click Link    Login

Submit Login Button
    Click Button    xpath=//button[normalize-space()='Login']

Verify Login Error
    [Arguments]    ${attempt}

    IF    ${attempt} < 3
        Wait Until Element Is Visible    xpath=//p[contains(.,'Invalid email or password')]
        Element Should Be Visible    xpath=//p[contains(.,'Invalid email or password. Please try again.')]
    ELSE
        Wait Until Element Is Visible    xpath=//p[contains(.,'Account temporarily suspended. Please wait')]
        Element Should Be Visible    xpath=//p[contains(.,'Account temporarily suspended. Please wait')]
    END