*** Settings ***
Resource    resourses.robot
Test Tags    robot:continue-on-failure

*** Test Cases ***
Go to Horses Page
    Start Login With SuperAdmin
    Redirect to Dashboard
    Click Horse Menu
    Wait Main Page Visible
    Click Add Horses Button
    Wait For Basic Section Visible
    Wait And Select Ant Dropdown    ${BASIC_TYPE}    Horse
    Verify Input Text Must Not Contain Thai And Special Characters    ${ORIGINAL_NAME}    ทดสอบABC123!@#$%^&*()    ABC123
    Verify Input Text Must Not Contain Special Characters    ${LOCAL_NAME}       ทดสอบABC123!@#$%^&*()    ทดสอบABC123!@#$%^&*() 
    Wait And Select Ant Dropdown    ${GENDER}    Gelding
    Wait And Select Ant Dropdown    ${COUNTRY_OF_BIRTH}    Thailand
    Wait And Select Ant Dropdown    ${BREED}    Warmblood
    Wait And Select Ant Dropdown    ${STUDBOOK}    Hanoverian Studbook
    Wait And Select Ant Dropdown    ${COLOR}    Bay
    Verify Height Field Rejects Value Exceeding Maximum    302    #ตรวจสอบค่าว่าเกิน 300 หรือไม่
    Verify Input For Number Only Field    ${MICROCHIP_NUMBER}    ทดสอบABC123!@#$%^456&*()789
    Verify Input Text Must Not Contain Special Characters    ${SIRE_NAME}       ทดสอบABC123!@#$%^&*()    ทดสอบABC123!@#$%^&*() 
    Verify Input Text Must Not Contain Special Characters    ${DAME_NAME}       ทดสอบABC123!@#$%^&*()    ทดสอบABC123!@#$%^&*()
    Verify Input Text Must Not Contain Special Characters    ${BREEDER}         ทดสอบABC123!@#$%^&*()    ทดสอบABC123!@#$%^&*()
    Wait And Select Ant Dropdown    ${PASSPORT_TYPE}    Original
    Wait And Select Ant Dropdown    ${PASSPORT_COUNTRY}    Germany
    Verify Input Text Must Not Contain Thai And Special Characters    ${PASSPORT_NUMBER}    ทดสอบABC123!@#$%^&*()    ABC123
    Click Button    ${ADD_PASSPORT_BTN}
    Wait Until Element Is Visible    //tr[.//div[normalize-space(.)='Original']]


