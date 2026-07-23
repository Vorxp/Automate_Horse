*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary.utils
Library    Collections

*** Variables ***
${URL}        https://product.d.tlogical.com/
${BROWSER}    chrome
${INPUT_VALUE}    ทดสอบABC123!@#$%^&*()
${EXPECTED_VALUE}    ABC123

${ORIGINAL_NAME}    name=originalName
${LOCAL_NAME}    name=localName
${BASIC_TYPE}    xpath=//label[.//span[normalize-space(.)="Type"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${GENDER}    xpath=//label[.//span[normalize-space(.)="Gender"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]

${DATE_OF_BIRTH}    xpath=//label[.//span[normalize-space(.)="Date Of Birth"]]/preceding-sibling::div//div[contains(@class,"tabler-icon-calendar-week")]
${TODAY_BTN}    xpath=//button[normalize-space(.)="Today"]
${CLICK_SELECT_YEAR}    xpath=//div[@class="flex items-center gap-1 cursor-pointer"]/svg

${COUNTRY_OF_BIRTH}    xpath=//label[.//span[normalize-space(.)="Country Of Birth"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${BREED}    xpath=//label[.//span[normalize-space(.)="Breed"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${STUDBOOK}    xpath=//label[.//span[normalize-space(.)="Studbook"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${COLOR}    xpath=//label[.//span[normalize-space(.)="Color"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${HEIGHT}    name=height
${MAX_HEIGHT}      301    # สมมติค่าสูงสุดที่ระบบอนุญาต
${SPECIAL_CHAR_PATTERN}    [^a-zA-Z0-9\u0E00-\u0E7F]
${THAI_CHAR_PATTERN}       ^[\u0E00-\u0E7F]
${NUMERIC_ONLY_PATTERN}     ^[0-9]+$
${NON_NUMERIC_PATTERN}      [^0-9]
${MICROCHIP_NUMBER}    name=microchipNumber

${SIRE_NAME}    name=sire    # Field ชื่อพ่อพันธุ์
${DAME_NAME}    name=dame    # Field ชื่อแม่พันธุ์
${BREEDER}    name=breeder    # Field ชื่อผู้เพาะพันธุ์

${REQUIRED_TYPE_PASSPORT}    xpath=//h3[normalize-space(.)="Passport"]/ancestor::div[contains(@class,"border-gray-200 rounded-xl")]
...    //label[.//span[normalize-space(.)="Type"]]/following-sibling::p[contains(@class,"field-error-message") and normalize-space(.)="Required"]
${REQUIRED_COUNTRY_PASSPORT}    xpath=//h3[normalize-space(.)="Passport"]/ancestor::div[contains(@class,"border-gray-200 rounded-xl")]
...    //label[.//span[normalize-space(.)="Country"]]/following-sibling::p[contains(@class,"text-red-500") and normalize-space(.)="Required"]
${REQUIRED_NUMBER_PASSPORT}    xpath=//h3[normalize-space(.)="Passport"]/ancestor::div[contains(@class,"border-gray-200 rounded-xl")]
...    //label[.//span[normalize-space(.)="Number"]]/following-sibling::p[contains(@class,"field-error-message") and normalize-space(.)="Required"]


${PASSPORT_TYPE}    xpath=//h3[normalize-space(.)="Passport"]/ancestor::div[contains(@class,"border-gray-200 rounded-xl")]
...    //label[.//span[normalize-space(.)="Type"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${PASSPORT_COUNTRY}    xpath=//label[.//span[normalize-space(.)="Country"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${PASSPORT_NUMBER}    name=passportNumber
${ADD_PASSPORT_BTN}    xpath=//button[normalize-space()='Add Passport']

${Horse_Profile_Photo_PATH}    xpath=//h3[normalize-space(.)="Horse Profile Photo"]/parent::div[contains(@class,"flex-col")]//input[@type='file']
${DELETE_Horse_Profile_Photo_BTN}    xpath=//h3[normalize-space(.)="Horse Profile Photo"]/parents::div[contains(@class,"flex-col")]//button[.//svg[contains(@class,"tabler-icon-trash")]]

${Horse_Passport_Photo_PATH}    xpath=//h3[normalize-space(.)="Upload file (Passport/Pre-purchase report)"]/parent::div[contains(@class,"flex-col")]//input[@type='file']
${HORSE_PASSPORT_RECORD_PATH}    xpath=//h3[normalize-space(.)="Upload file (Passport/Pre-purchase report)"]/parent::div[contains(@class,"flex-col")]//div[.//span[normalize-space(.)='passport.jpg']]

${SAVE_BTN}    xpath=//button[normalize-space(.)='Save']
${REMARK}    name=remarks

${CANCEL_BTN}    xpath=//button[normalize-space(.)='Cancel']

*** Keywords ***
Start on Webpage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Equora
    Wait Until Element Is Visible    id=section-1
    FOR    ${i}    IN RANGE    1    4
        Element Should Be Visible    id=section-${i}
    END
    Click Link    Login

Start Login With SuperAdmin
    Start on Webpage
    Wait Until Element Is Enabled    name=email
    Input Text    name=email    superadmin@tlogical.com
    Input Password    name=password    a
    Click Button    xpath=//button[normalize-space()='Login']

Redirect to Dashboard
    Wait Until Location Is    ${URL}combined/dashboard

Click Horse Menu
    Wait Until Element Is Visible    xpath=//a[@href='/combined/horses']
    Click Element    xpath=//a[@href='/combined/horses']

Wait Main Page Visible
    Wait Until Location Contains    /combined/horses
    Wait Until Element Is Visible   //button[normalize-space()='+ Add Horses']

Click Add Horses Button
    Click Element    //button[normalize-space()='+ Add Horses']

Wait For Basic Section Visible
    Wait Until Location Is    ${URL}combined/horses/add
    Wait Until Element Is Visible    ${SECTION_BASIC}    timeout=10s

Wait And Input
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Scroll Element Into View         ${locator}
    Click Element                    ${locator}
    Input Text                       ${locator}    ${text}

Wait And Select Ant Dropdown
    [Arguments]    ${locator}    ${option}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Scroll Element Into View         ${locator}
    Click Element                    ${locator}
    Wait Until Element Is Visible    xpath=//div[contains(@class,'ant-select-dropdown') and not(contains(@class,'ant-select-dropdown-hidden'))]
    Click Element    xpath=(//div[contains(@class,'ant-select-dropdown') and not(contains(@class,'ant-select-dropdown-hidden'))]//div[contains(@class,'ant-select-item-option') and @title='${option}'])[last()]


Verify Height Field Rejects Value Exceeding Maximum
    [Arguments]    ${VALUE_HEIGHT}    ${FIELD_NAME}
    Wait Until Element Is Visible    ${HEIGHT}
    Input Text    ${HEIGHT}    ${VALUE_HEIGHT}
    ${ACTUAL_VALUE}=    Get Value    ${HEIGHT}
    Should Not Be Equal As Strings    ${ACTUAL_VALUE}    ${MAX_HEIGHT}
    ...    msg=Field ${FIELD_NAME} ระบบยอมให้กรอกค่าเกิน max ได้ ซึ่งไม่ควรเกิดขึ้น!

    Log    ค่าที่กรอกได้จริงในช่อง: ${ACTUAL_VALUE}

Verify Input Text Must Not Contain Thai And Special Characters
    [Arguments]    ${FIELD_LOCATOR}    ${INPUT_VALUES}    ${EXPECTED_VALUE}    ${FIELD_NAME}
    Wait Until Element Is Visible    ${FIELD_LOCATOR}    timeout=10s
    Input Text    ${FIELD_LOCATOR}    ${INPUT_VALUES}
    Field Value Should Not Contain Special Characters    ${FIELD_LOCATOR}    ${INPUT_VALUES}    ${EXPECTED_VALUE}    ${FIELD_NAME}
    Field Value Should Not Contain Thai Characters    ${FIELD_LOCATOR}    ${INPUT_VALUES}    ${EXPECTED_VALUE}    ${FIELD_NAME}
    Field Value Should Be Equal To Expected    ${FIELD_LOCATOR}    ${INPUT_VALUES}    ${EXPECTED_VALUE}    ${FIELD_NAME}

Verify Input Text Must Not Contain Special Characters
    [Arguments]    ${FIELD_LOCATOR}    ${INPUT_VALUE}    ${EXPECTED_VALUE}    ${FIELD_NAME}
    Wait Until Element Is Visible    ${FIELD_LOCATOR}    timeout=10s
    Input Text    ${FIELD_LOCATOR}    ${INPUT_VALUE}
    Field Value Should Not Contain Special Characters    ${FIELD_LOCATOR}    ${INPUT_VALUE}    ${EXPECTED_VALUE}    ${FIELD_NAME}
    Field Value Should Be Equal To Expected    ${FIELD_LOCATOR}    ${INPUT_VALUE}    ${EXPECTED_VALUE}    ${FIELD_NAME}

Verify Input For Number Only Field
    [Arguments]    ${FIELD_LOCATOR}    ${INPUT_VALUE}    ${FIELD_NAME}
    Wait Until Element Is Visible    ${FIELD_LOCATOR}    timeout=10s
    Input Text    ${FIELD_LOCATOR}    ${INPUT_VALUE}
    ${ACTUAL_VALUE}=    Get Value    ${FIELD_LOCATOR}
    Should Not Match Regexp    ${ACTUAL_VALUE}    ${NON_NUMERIC_PATTERN}
    ...    msg=Field ${FIELD_NAME} พบตัวอักษรที่ไม่ใช่ตัวเลขหลงเหลือใน field: ${ACTUAL_VALUE}

Field Value Should Not Contain Special Characters
    [Arguments]    ${FIELD_LOCATOR}    ${ACTUAL_VALUE}    ${EXPECTED_VALUE}    ${FIELD_NAME}
    ${ACTUAL_VALUE}=    Get Value    ${FIELD_LOCATOR}
    Should Not Match Regexp    ${ACTUAL_VALUE}    ${SPECIAL_CHAR_PATTERN}
    ...    msg=Field ${FIELD_NAME} พบอักขระพิเศษหลงเหลือใน field ซึ่งไม่ควรเกิดขึ้น: ${ACTUAL_VALUE}
    Log    ค่าที่กรอกได้จริงในช่อง: ${ACTUAL_VALUE}

Field Value Should Not Contain Thai Characters
    [Arguments]    ${FIELD_LOCATOR}    ${ACTUAL_VALUE}    ${EXPECTED_VALUE}    ${FIELD_NAME}
    ${ACTUAL_VALUE}=    Get Value    ${FIELD_LOCATOR}
    Should Not Match Regexp    ${ACTUAL_VALUE}    ${THAI_CHAR_PATTERN}
    ...    msg=Field ${FIELD_NAME} พบภาษาไทยหลงเหลือใน field ซึ่งไม่ควรเกิดขึ้น: ${ACTUAL_VALUE}
    Log    ค่าที่กรอกได้จริงในช่อง: ${ACTUAL_VALUE}

Field Value Should Be Equal To Expected
    [Arguments]    ${FIELD_LOCATOR}    ${ACTUAL_VALUE}    ${EXPECTED_VALUE}    ${FIELD_NAME}
    ${ACTUAL_VALUE}=    Get Value    ${FIELD_LOCATOR}
    Should Be Equal As Strings    ${ACTUAL_VALUE}    ${EXPECTED_VALUE}
    ...    msg=Field ${FIELD_NAME} ค่าที่เหลือใน field ไม่ตรงกับที่คาดหวัง | Actual: ${ACTUAL_VALUE} | Expected: ${EXPECTED_VALUE}

Check Required Passport Section
    Click Button    ${ADD_PASSPORT_BTN}
    Wait Until Element Is Visible    ${REQUIRED_TYPE_PASSPORT}    timeout=10s
    Element Should Be Visible    ${REQUIRED_TYPE_PASSPORT}
    Wait Until Element Is Visible    ${REQUIRED_COUNTRY_PASSPORT}    timeout=10s
    Element Should Be Visible    ${REQUIRED_COUNTRY_PASSPORT}
    Wait Until Element Is Visible    ${REQUIRED_NUMBER_PASSPORT}    timeout=10s
    Element Should Be Visible    ${REQUIRED_NUMBER_PASSPORT}

Check Record Added In Passport Section
    Wait Until Element Is Visible    //tr[.//div[normalize-space(.)='Original'] and .//div[normalize-space(.)='Germany'] and .//div[normalize-space(.)='ABC123']]

Choose Year
    [Arguments]    ${year}
    Click Element    ${DATE_OF_BIRTH}
    Wait Until Element Is Visible    ${TODAY_BTN}    timeout=10s
    Element Should Be Visible    ${TODAY_BTN}
    Click Element    ${CLICK_SELECT_YEAR}
    Wait Until Element Is Visible    xpath=//button[normalize-space(.)='${year}']    timeout=10s
    Click Element    xpath=//button[normalize-space(.)='${year}']

Choose Month and Day
    [Arguments]    ${month}    ${day}
    FOR    ${i}    IN    1    13
        Click Element    xpath=//div[contains(@class,"flex items-center justify-center")]//svg[path[@d="M0 0h24v24H0V0z"]]"
        Wait Until Element Is Visible    xpath=//div[normalize-space(.)='${i}']    timeout=10s
        Element Should Be Visible    xpath=//div[normalize-space(.)='${i}']
    END
    Click Element    xpath=//div[normalize-space(.)='${day}']
    
PICKDATE
    [Arguments]    ${year}    ${month}    ${day}
    Choose Year    ${year}
    Choose Month and Day    ${month}    ${day}