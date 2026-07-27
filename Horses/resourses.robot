*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary.utils
Library    Collections

*** Variables ***
${PRODUCT_URL}        https://product.d.tlogical.com/
${EQUORA_URL}        https://equora.d.tlogical.com/
${BROWSER}    chrome
${INPUT_VALUE}    ทดสอบABC123!@#$%^&*()
${EXPECTED_VALUE}    ABC123

#-------------------------- Create ------------------------------#
${SECTION_BASIC}    xpath=//h3[normalize-space(.)="Basic Information"]
${ORIGINAL_NAME}    xpath=//*[@name='originalName']
${LOCAL_NAME}    name=localName
${BASIC_TYPE}    xpath=//label[.//span[normalize-space(.)="Type"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${GENDER}    xpath=//label[.//span[normalize-space(.)="Gender"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${DATE_OF_BIRTH}    xpath=//label[.//span[normalize-space(.)="Date of Birth"]]/preceding-sibling::div[contains(@class,"absolute right-3 top-1/2 translate-y-[-50%] cursor-pointer z-10 bg-white")]
${YEAR_DROPDOWN}    xpath=//label[.//span[normalize-space(.)="Date of Birth"]]/preceding-sibling::div[contains(@class,"cursor-default")]//div[contains(@class,"flex items-center gap-1 cursor-pointer")]
${YEAR_SELECTOR}    xpath=//label[.//span[normalize-space(.)="Date of Birth"]]/preceding-sibling::div[contains(@class,"cursor-default")]//div[contains(@class,"grid-cols-4")]
# ${TODAY_BTN}    xpath=//button[normalize-space(.)="Today"]
${CLICK_SELECT_YEAR}    xpath=//div[@class="flex items-center gap-1 cursor-pointer"]/svg
${DATE_PICKER_PREVIOUS_MONTH}    xpath=//label[.//span[normalize-space(.)="Date of Birth"]]/preceding-sibling::div[contains(@class,"cursor-default")]//div[contains(@class,"justify-center items-center gap-2")]/preceding-sibling::div[contains(@class,"rounded-md text-white hover:bg-[#083053] pl-1")]
${DATE_PICKER_NEXT_MONTH}    xpath=//label[.//span[normalize-space(.)="Date of Birth"]]/preceding-sibling::div[contains(@class,"cursor-default")]//div[contains(@class,"justify-center items-center gap-2")]/following-sibling::div[contains(@class,"rounded-md text-white hover:bg-[#083053] pl-1")]
${DATE_PICKER_DAY}    xpath=//label[.//span[normalize-space(.)="Date of Birth"]]/preceding-sibling::div[contains(@class,"cursor-default")]//div[contains(@class,"justify-center items-center gap-2")]/parent::div[contains(@class,"flex items-center gap-2")]/following-sibling::div[contains(@class,"grid-cols-7")]

${COUNTRY_OF_BIRTH}    xpath=//label[.//span[normalize-space(.)="Country Of Birth"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${BREED}    xpath=//label[.//span[normalize-space(.)="Breed"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${STUDBOOK}    xpath=//label[.//span[normalize-space(.)="Studbook"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${COLOR}    xpath=//label[.//span[normalize-space(.)="Color"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${HEIGHT}    xpath=//*[@name='height']
${MAX_HEIGHT}      301    # สมมติค่าสูงสุดที่ระบบอนุญาต
${SPECIAL_CHAR_PATTERN}    [^a-zA-Z0-9\u0E00-\u0E7F]
${THAI_CHAR_PATTERN}       ^[\u0E00-\u0E7F]
${NUMERIC_ONLY_PATTERN}     ^[0-9]+$
${NON_NUMERIC_PATTERN}      [^0-9]
${MICROCHIP_NUMBER}    name=microchipNumber

${SIRE_NAME}    name=sire    # Field ชื่อพ่อพันธุ์
${DAME_NAME}    name=dame    # Field ชื่อแม่พันธุ์
${BREEDER}    name=breeder    # Field ชื่อผู้เพาะพันธุ์

${ORIGINAL_NAME_ERROR_MESSAGE}    ${ORIGINAL_NAME}/parent::div/following-sibling::p[contains(@class,'field-error-message')]
${TYPE_ERROR_MESSAGE}    xpath=//label[.//span[normalize-space(.)="Type"]]/following-sibling::p[contains(@class,'field-error-message')]
${GENDER_ERROR_MESSAGE}    xpath=//label[.//span[normalize-space(.)="Gender"]]/following-sibling::p[contains(@class,'field-error-message')]
${DATE_OF_BIRTH_ERROR_MESSAGE}    xpath=//label[.//span[normalize-space(.)="Date of Birth"]]/parent::div/following-sibling::p[contains(@class,'text-xs text-red-500')]
${COUNTRY_OF_BIRTH_ERROR_MESSAGE}    xpath=//label[.//span[normalize-space(.)="Country Of Birth"]]/following-sibling::p[contains(@class,'text-xs text-red-500')]
${BREED_ERROR_MESSAGE}    xpath=//label[.//span[normalize-space(.)="Breed"]]/following-sibling::p[contains(@class,'text-xs text-red-500')]
${COLOR_ERROR_MESSAGE}    xpath=//label[.//span[normalize-space(.)="Color"]]/following-sibling::p[contains(@class,'text-xs text-red-500')]
${HEIGHT_ERROR_MESSAGE}    ${HEIGHT}/parent::div/following-sibling::p[contains(@class,'field-error-message')]

${REQUIRED_TYPE_PASSPORT}    xpath=//h3[normalize-space(.)="Passport"]/ancestor::div[contains(@class,"border-gray-200 rounded-xl")]
...    //label[.//span[normalize-space(.)="Type"]]/following-sibling::p[contains(@class,"field-error-message") and normalize-space(.)="Required"]
${REQUIRED_COUNTRY_PASSPORT}    xpath=//h3[normalize-space(.)="Passport"]/ancestor::div[contains(@class,"border-gray-200 rounded-xl")]
...    //label[.//span[normalize-space(.)="Country"]]/following-sibling::p[contains(@class,"text-red-500") and normalize-space(.)="Required"]
${REQUIRED_NUMBER_PASSPORT}    xpath=//h3[normalize-space(.)="Passport"]/ancestor::div[contains(@class,"border-gray-200 rounded-xl")]
...    //label[.//span[normalize-space(.)="Number"]]/following-sibling::p[contains(@class,"field-error-message") and normalize-space(.)="Required"]

${ERROR_MESSAGE_PASSPORT_TYPE}    xpath=//h3[normalize-space(.)="Passport"]/parent::div/following-sibling::p[contains(@class,"text-xs text-red-500")]
${PASSPORT_TYPE}    xpath=//h3[normalize-space(.)="Passport"]/ancestor::div[contains(@class,"border-gray-200 rounded-xl")]
...    //label[.//span[normalize-space(.)="Type"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${PASSPORT_COUNTRY}    xpath=//label[.//span[normalize-space(.)="Country"]]/preceding-sibling::div[contains(@class,"ant-select")]//div[contains(@class,"ant-select-selector")]
${PASSPORT_NUMBER}    name=passportNumber
${ADD_PASSPORT_BTN}    xpath=//button[normalize-space()='Add Passport']

${Horse_Profile_Photo_PATH}    xpath=//h3[normalize-space(.)="Horse Profile Photo"]/parent::div[contains(@class,"flex-col")]//input[@type='file']
${DELETE_Horse_Profile_Photo_BTN}    xpath=//h3[normalize-space(.)="Horse Profile Photo"]/following-sibling::div//button[contains(@aria-label,'Remove photo')]//svg[contains(@class,"tabler-icon-trash")]

${Horse_Passport_Photo_PATH}    xpath=//h3[contains(text(),'Upload file')]/following-sibling::div[contains(@class,"flex-col")]/descendant::input[@type='file']
${HORSE_PASSPORT_RECORD_PATH}    xpath=//h3[normalize-space(.)="Upload file (Passport/Pre-purchase report)"]/following-sibling::div[contains(@class,"flex-col")]//div[.//span[normalize-space(.)='passport.jpg']]

${SAVE_BTN}    xpath=//button[normalize-space(.)='Save']
${REMARK}    name=remarks

${CANCEL_BTN}    xpath=//button[normalize-space(.)='Cancel']
#-------------------------- End Create ------------------------------#

#-------------------------- Table ------------------------------#
${TABLE_HORSES}    xpath=//table[contains(@class,'w-full caption-bottom text-sm table-auto')]


*** Keywords ***
Start on Webpage
    Open Browser    ${PRODUCT_URL}    ${BROWSER}
    #Open Browser    ${EQUORA_URL}    ${BROWSER}
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
    Wait Until Location Is    ${PRODUCT_URL}combined/dashboard
    #Wait Until Location Is    ${EQUORA_URL}combined/dashboard
    # แล้วถ้าเขาไม่มีเมนู Dashboard หล่ะ
    # จะ redirect ไปหน้าอื่นแทน เช่น /combined/horses แทนดีไหม

Click Horse Menu
    Wait Until Element Is Visible    xpath=//a[@href='/combined/horses']
    Click Element    xpath=//a[@href='/combined/horses']

Wait Main Page Visible
    Wait Until Location Contains    /combined/horses
    Wait Until Element Is Visible   //button[normalize-space()='+ Add Horses']

Click Add Horses Button
    Click Element    //button[normalize-space()='+ Add Horses']

Wait For Basic Section Visible
    Wait Until Location Is    ${PRODUCT_URL}combined/horses/add
    Wait Until Element Is Visible    ${SECTION_BASIC}    timeout=10s

Open Horse Page
    Start Login With SuperAdmin
    Redirect to Dashboard
    Click Horse Menu
    Wait Main Page Visible

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

# Check Required Passport Section
#     Click Button    ${ADD_PASSPORT_BTN}
#     Wait Until Element Is Visible    ${REQUIRED_TYPE_PASSPORT}    timeout=10s
#     Element Should Be Visible    ${REQUIRED_TYPE_PASSPORT}
#     Wait Until Element Is Visible    ${REQUIRED_COUNTRY_PASSPORT}    timeout=10s
#     Element Should Be Visible    ${REQUIRED_COUNTRY_PASSPORT}
#     Wait Until Element Is Visible    ${REQUIRED_NUMBER_PASSPORT}    timeout=10s
#     Element Should Be Visible    ${REQUIRED_NUMBER_PASSPORT}

Check Record Added In Passport Section
    Wait Until Element Is Visible    //tr[.//div[normalize-space(.)='Original'] and .//div[normalize-space(.)='Germany'] and .//div[normalize-space(.)='ABC123']]

# ----------- #
Get Date Picker Month Text
    ${month_text}=    Get Text    xpath=//label[.//span[normalize-space(.)="Date of Birth"]]/preceding-sibling::div[contains(@class,"cursor-default")]//div[contains(@class,"justify-center items-center gap-2")]/span
    RETURN    ${month_text}

Click Date Picker Previous Month
    Click Element    ${DATE_PICKER_PREVIOUS_MONTH}

Click Date Picker Next Month
    Click Element    ${DATE_PICKER_NEXT_MONTH}


Get Month Name
    [Arguments]    ${month}
    ${month_index}=    Evaluate    int(${month}) - 1
    ${months}=    Create List    January    February    March    April    May    June    July    August    September    October    November    December
    ${month_name}=    Get From List    ${months}    ${month_index}
    RETURN    ${month_name}

Get Month Number From Name
    [Arguments]    ${month_name}
    ${months}=    Create List    January    February    March    April    May    June    July    August    September    October    November    December
    ${month_index}=    Evaluate    ${months}.index("${month_name}") + 1
    RETURN    ${month_index}

PICKDATES
    [Arguments]    ${year}    ${month}    ${day}
    Element Should Be Visible    ${Date of Birth}
    Click Element    ${Date of Birth}
    Wait Until Element Is Visible    ${YEAR_DROPDOWN}    timeout=10s
    Click Element    ${YEAR_DROPDOWN}
    Wait Until Element Is Visible    ${YEAR_SELECTOR}    timeout=10s
    Click Element    ${YEAR_SELECTOR}/button[normalize-space(.)="${year}"]
    Element Text Should Be    ${YEAR_DROPDOWN}/span    ${year}
    ${MONTH_NAME}=    Get Date Picker Month Text
    ${MONTH_NUMBER}=    Get Month Number From Name    ${MONTH_NAME}
    ${target_month_number}=    Convert To Integer    ${month}

    FOR    ${attempt}    IN RANGE    12
        ${current_month}=    Get Date Picker Month Text
        ${current_month_number}=    Get Month Number From Name    ${current_month}
        IF    ${current_month_number} == ${target_month_number}
            Exit For Loop
        END
        IF    ${current_month_number} < ${target_month_number}
            Click Date Picker Next Month
        ELSE
            Click Date Picker Previous Month
        END
        Sleep    200ms
    END

    ${current_month}=    Get Date Picker Month Text
    ${current_month_number}=    Get Month Number From Name    ${current_month}
    Should Be Equal As Integers    ${current_month_number}    ${target_month_number}
    Wait Until Element Is Visible    ${DATE_PICKER_DAY}    timeout=10s
    Click Element    ${DATE_PICKER_DAY}/div[normalize-space(.)="${day}"]
    
#------------------------------------#

Check Age After Select Date Of Birth
    [Arguments]    ${expected_age}
    ${actual_age}=    Get Value    name=age
    Should Be Equal As Strings    ${actual_age}    ${expected_age}

Check Required Field Validation
    [Arguments]    ${locator}    ${expected_message}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Element Should Be Visible    ${locator}
    ${actual_message}=    Get Text    ${locator}
    Should Be Equal As Strings    ${actual_message}    ${expected_message}

Save And Scroll To Top
    Scroll Element Into View    ${SAVE_BTN}
    Click Button    ${SAVE_BTN}
    Scroll Element Into View    ${BASIC_TYPE}

Basic Information Validation
    Check Required Field Validation    ${TYPE_ERROR_MESSAGE}    Required
    Check Required Field Validation    ${ORIGINAL_NAME_ERROR_MESSAGE}    Required
    Check Required Field Validation    ${GENDER_ERROR_MESSAGE}    Required
    Check Required Field Validation    ${DATE_OF_BIRTH_ERROR_MESSAGE}    Required
    Check Required Field Validation    ${COUNTRY_OF_BIRTH_ERROR_MESSAGE}    Required
    Check Required Field Validation    ${BREED_ERROR_MESSAGE}    Required
    Check Required Field Validation    ${COLOR_ERROR_MESSAGE}    Required
    Check Required Field Validation    ${HEIGHT_ERROR_MESSAGE}    Required
    Check Required Field Validation    ${ERROR_MESSAGE_PASSPORT_TYPE}    At least 1 passport record is required.

Passport Section Validation
    Click Button    ${ADD_PASSPORT_BTN}    
    Check Required Field Validation    ${REQUIRED_TYPE_PASSPORT}    Required
    Check Required Field Validation    ${REQUIRED_COUNTRY_PASSPORT}    Required
    Check Required Field Validation    ${REQUIRED_NUMBER_PASSPORT}    Required

Check Duplicate Passport
    FOR    ${i}    IN RANGE    1    3
        Wait And Select Ant Dropdown    ${PASSPORT_TYPE}    Original
        Wait And Select Ant Dropdown    ${PASSPORT_COUNTRY}    Germany
        Verify Input Text Must Not Contain Thai And Special Characters    ${PASSPORT_NUMBER}    ${INPUT_VALUE}    ${EXPECTED_VALUE}   PassportNumber
        Click Button    ${ADD_PASSPORT_BTN}
        IF    ${i} == 1
            Check Record Added In Passport Section
        ELSE
            Wait Until Element Is Visible      xpath=//h3[normalize-space(.)="Passport"]/ancestor::div[contains(@class,"border-gray-200 rounded-xl")]//label[.//span[normalize-space(.)="Number"]]/following-sibling::p[contains(@class,"field-error-message") and normalize-space(.)="This passport already exists."]
        END
    END

Validate Horse Record In Table
    [Arguments]    ${horse_name}
    Wait Until Element Is Visible    ${TABLE_HORSES}    timeout=10s
    ${horse_row}=    Get WebElement    ${TABLE_HORSES}//tr//td//div/div[.//span[@class='font-semibold text-slate-800' and normalize-space(.)='${horse_name}']]
    Element Should Be Visible    ${horse_row}

#---------------------------------------------------------#

Validate No Record In Table
    Wait Until Element Is Visible    xpath=//h2[normalize-space(.)='No records found']    timeout=10s
    ${no_record_message}=    Get Text    xpath=//h2[normalize-space(.)='No records found']
    Should Be Equal As Strings    ${no_record_message}    No records found

