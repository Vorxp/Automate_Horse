*** Settings ***
Resource    resourses.robot

*** Test Cases ***
Open webpage And Verification
    Start on Webpage
    Click Link    Features
    Sleep    2s
    Click Link    Pricing
    Sleep    2s
    Click Link    Home
    Sleep    2s
    Close Browser

Button Test
    Start Login
    Wait Until Element Is Enabled    name=email    timeout=10s
    Click Element    xpath=//button[.//span[normalize-space()='English']]  #กดปุ่มเปลี่ยนภาษา
    Sleep    2s
    Click Element    xpath=//button[.//span[normalize-space()='ภาษาไทย']]  #เลือกภาษาไทย
    Wait Until Element Is Visible    xpath=//p[contains(.,'ยินดีต้อนรับสู่')]    timeout=10s
    Sleep    2s
    Click Element    xpath=//button[.//span[normalize-space()='ภาษาไทย']]  #กดปุ่มเปลี่ยนภาษา
    Sleep    2s
    Click Element    xpath=//button[.//span[normalize-space()='English']]  #เลือกภาษาอังกฤษ
    Wait Until Element Is Visible    xpath=//p[contains(.,'Welcome to')]    timeout=10s
    Sleep    2s

No Input Login
    Start Login
    Wait Until Element Is Enabled    name=email
    Submit Login Button
    Wait Until Element Is Visible    xpath=//p[contains(.,'Please fill in information')]
    Element Should Be Visible    xpath=//p[contains(.,'Please fill in information')]
    Close Browser

Invalid Login
    Start Login
    Wait Until Element Is Enabled    name=email
    Input Text    name=email    test@test.com
    Input Password    name=password    1234
    Submit Login Button
    Wait Until Element Is Visible    xpath=//p[contains(.,'Invalid email or password')]
    Element Should Be Visible    xpath=//p[contains(.,'Invalid email or password. Please try again.')]
    Close Browser

Invalid 3 Time
    Start Login
    FOR    ${i}    IN RANGE    1    4
        Wait Until Element Is Enabled    name=email
        Input Text    name=email    vorapol.bo@gmail.com
        Input Password    name=password    1234
        Submit Login Button
        Verify Login Error    ${i}
    END
    Close Browser
    
# Forgot Password Page
#     Start Login
#     Click Link    Forgot Password?
#     Wait Until Element Is Visible    xpath=//button[normalize-space()='Forgot Password']

Valid Login
    Start Login
    Input Text    name=email    superadmin@tlogical.com
    Input Password    name=password    a
    Submit Login Button
    Wait Until Location Is    https://product.d.tlogical.com/combined/dashboard
    Sleep    2s
    