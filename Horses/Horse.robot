*** Settings ***
Resource    resourses.robot
Test Tags    robot:continue-on-failure

*** Test Cases ***
Create Horse
    Open Horse Page
    Click Add Horses Button
    Wait For Basic Section Visible
    Wait And Select Ant Dropdown    ${BASIC_TYPE}    Horse
    Verify Input Text Must Not Contain Thai And Special Characters    ${ORIGINAL_NAME}    ${INPUT_VALUE}    ${EXPECTED_VALUE}   OriginalName
    Verify Input Text Must Not Contain Special Characters    ${LOCAL_NAME}       ${INPUT_VALUE}    ทดสอบ${EXPECTED_VALUE}   LocalName
    Wait And Select Ant Dropdown    ${GENDER}    Gelding
    PICKDATES    2024    3    13    #เลือกวันเกิด Year Month Day
    Check Age After Select Date Of Birth    2 years    #ตรวจสอบอายุหลังจากเลือกวันเกิด
    Wait And Select Ant Dropdown    ${COUNTRY_OF_BIRTH}    Thailand
    Wait And Select Ant Dropdown    ${BREED}    Warmblood
    Wait And Select Ant Dropdown    ${STUDBOOK}    Hanoverian Studbook
    Wait And Select Ant Dropdown    ${COLOR}    Bay
    Verify Height Field Rejects Value Exceeding Maximum    300    Height  #ตรวจสอบค่าว่าเกิน 300 หรือไม่
    Verify Input For Number Only Field    ${MICROCHIP_NUMBER}    ${INPUT_VALUE}   MicrochipNumber
    Verify Input Text Must Not Contain Special Characters    ${SIRE_NAME}       ${INPUT_VALUE}    ทดสอบ${EXPECTED_VALUE}   SireName
    Verify Input Text Must Not Contain Special Characters    ${DAME_NAME}       ${INPUT_VALUE}    ทดสอบ${EXPECTED_VALUE}   DameName
    Verify Input Text Must Not Contain Special Characters    ${BREEDER}         ${INPUT_VALUE}    ทดสอบ${EXPECTED_VALUE}   Breeder
    # Check Required Passport Section
    Wait And Select Ant Dropdown    ${PASSPORT_TYPE}    Original
    # Element Should Not Be Visible    ${REQUIRED_TYPE_PASSPORT}
    Wait And Select Ant Dropdown    ${PASSPORT_COUNTRY}    Germany
    # Element Should Not Be Visible    ${REQUIRED_COUNTRY_PASSPORT}
    Verify Input Text Must Not Contain Thai And Special Characters    ${PASSPORT_NUMBER}    ${INPUT_VALUE}    ${EXPECTED_VALUE}   PassportNumber
    # Element Should Not Be Visible    ${REQUIRED_NUMBER_PASSPORT}
    Click Button    ${ADD_PASSPORT_BTN}
    Check Record Added In Passport Section
    Choose File    ${Horse_Profile_Photo_PATH}    ${CURDIR}/Assets/Horse4.jpg
    Scroll Element Into View      ${SAVE_BTN}
    Choose File    ${Horse_Passport_Photo_PATH}    ${CURDIR}/Assets/passport.jpg
    Wait Until Element Is Visible    ${HORSE_PASSPORT_RECORD_PATH}    timeout=10s
    Wait And Input    ${REMARK}    This is a test remark ทดสอบหมายเหตุ 1234!@#$#{}().
    Wait Until Element Contains    ${REMARK}    This is a test remark ทดสอบหมายเหตุ 1234!@#$#{}().    timeout=10s
    Click Button    ${SAVE_BTN}
    Double Click Element    ${SAVE_BTN}
    Validate Horse Record In Table    ${EXPECTED_VALUE}
    Close Browser

Create Horse With No Input
    Open Horse Page
    Click Add Horses Button
    Wait For Basic Section Visible
    Save And Scroll To Top
    Basic Information Validation
    Passport Section Validation
    Close Browser

# Table With No Record
#     Open Horse Page
#     Validate No Record In Table
#     Close Browser

Duplicate Passport Number
    Open Horse Page
    Click Add Horses Button
    Wait For Basic Section Visible
    Check Duplicate Passport
    Close Browser

