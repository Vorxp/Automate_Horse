*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    resourses.robot

*** Variables ***
${EN_NAME_LOCATOR}       xpath=//table//tbody/tr/td[2]/div
${NEXT_BUTTON}           xpath=//button[.//*[contains(concat(' ', normalize-space(@class), ' '), ' tabler-icon-chevron-right ')]]
${ROWS_PER_PAGE_BTN}     xpath=//button[@role='combobox' and @data-slot='select-trigger']

*** Test Cases ***
Collect All Menu Names Across Pages And Verify

    Open SuperAdmin
    Wait Until Element Is Visible    ${Menu Management Button}
    Click Element    ${Menu Management Button}
    Click Main Menu
    @{ALL_NAMES_PAGINATED}=    Create List

    WHILE    True
        # 1. รอให้ตารางโหลดเสร็จก่อนอ่านข้อมูล
        Wait Until Element Is Visible    ${EN_NAME_LOCATOR}    timeout=5s

        # 2. ดึงชื่อ EN ทุกแถวในหน้านี้
        @{PAGE_NAMES}=    Get Table Column Names

        # 3. เก็บรวมเข้า list หลัก
        FOR    ${NAME}    IN    @{PAGE_NAMES}
            Append To List    ${ALL_NAMES_PAGINATED}    ${NAME}
        END
        Log    Collected so far: ${ALL_NAMES_PAGINATED}

        # 4. เช็คว่าปุ่ม Next ยัง enable อยู่ไหม
        ${IS_DISABLED}=    Run Keyword And Return Status
        ...    Element Attribute Value Should Be    ${NEXT_BUTTON}    disabled    ${EMPTY}

        IF    ${IS_DISABLED}
            Log    Reached last page, stop pagination
            Exit For Loop
        ELSE
            Click Element    ${NEXT_BUTTON}
            Sleep    0.5s    # รอ transition/re-render ของตาราง
        END
    END

    Log    Total items collected via pagination: ${ALL_NAMES_PAGINATED}

    # 5. เปิด dropdown Rows per page แล้วเลือกจำนวนมากสุด
    Click Element    ${ROWS_PER_PAGE_BTN}
    Select Max Rows Per Page

    # 6. อ่านข้อมูลใหม่ทั้งหมดจากหน้าเดียว (ควรครบทุก record)
    Wait Until Element Is Visible    ${EN_NAME_LOCATOR}    timeout=5s
    @{ALL_NAMES_SINGLE_PAGE}=    Get Table Column Names

    Log    Total items on single page: ${ALL_NAMES_SINGLE_PAGE}

    # 7. เปรียบเทียบว่าข้อมูลตรงกันหรือไม่ (ไม่สนลำดับ)
    ${SORTED_PAGINATED}=    Evaluate    sorted($ALL_NAMES_PAGINATED)
    ${SORTED_SINGLE}=       Evaluate    sorted($ALL_NAMES_SINGLE_PAGE)
    Lists Should Be Equal    ${SORTED_PAGINATED}    ${SORTED_SINGLE}
    ...    msg=ข้อมูลจากการ paginate ไม่ตรงกับข้อมูลตอนแสดงทั้งหมดในหน้าเดียว!

*** Keywords ***
Get Table Column Names
    @{ELEMENTS}=    Get WebElements    ${EN_NAME_LOCATOR}
    @{NAMES}=    Create List
    FOR    ${EL}    IN    @{ELEMENTS}
        ${TEXT}=    Get Text    ${EL}
        Append To List    ${NAMES}    ${TEXT}
    END
    RETURN    @{NAMES}

Select Max Rows Per Page
    # dropdown แต่ละครั้งจะมี id เปลี่ยน (radix-_r_xx_) จึงหาจาก role=option + text
    Wait Until Element Is Visible    xpath=//div[@role='option']    timeout=3s
    @{OPTION_ELEMENTS}=    Get WebElements    xpath=//div[@role='option']
    @{OPTION_VALUES}=    Create List

    FOR    ${OPT}    IN    @{OPTION_ELEMENTS}
        ${VAL}=    Get Text    ${OPT}
        Append To List    ${OPTION_VALUES}    ${VAL}
    END

    # แปลงเป็นตัวเลขแล้วหาค่ามากสุด
    @{NUMS}=    Evaluate    [int(x) for x in $OPTION_VALUES]
    ${MAX_VAL}=    Evaluate    max($NUMS)

    Click Element    xpath=//div[@role='option'][.//span[text()='${MAX_VAL}']]
    Log    Selected rows per page: ${MAX_VAL}