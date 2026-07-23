*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary.utils
Library    Collections

*** Variables ***
${URL}        https://product.d.tlogical.com/
${BROWSER}    chrome
${Menu Management Button}    xpath=//span[contains(.,'Menu Management')]
${Main Menu Button}    xpath=//span[contains(.,'Main Menus')]
${Sub Menu Button}    xpath=//span[contains(.,'Sub Menus')]
${Child Menu Button}    xpath=//span[contains(.,'Child Menus')]

${NAME_TH}           name=name_th
${NAME_EN}           name=name_en
${PATH}              name=path
${DESCRIPTION}       xpath=//div[@role='dialog']//input[@name='description']
${ICON}              name=icon_key
${SEQUENCE}          name=sequence_index

${SAVE_BTN}          xpath=//button[normalize-space()='Save']
${CANCEL_BTN}        xpath=//button[normalize-space()='Cancel']
${CONFRIM_BTN}       xpath=//button[normalize-space()='Confirm']

${CREATE_NAME_TH}    การทดสอบสร้างเมนูหลัก
${CREATE_NAME_EN}    Test Create Main Menu
${CREATE_PATH}       /combined/test-main-menu
${CREATE_DESCRIPTION}    คำอธิบายการทดสอบสร้างเมนูหลัก
${CREATE_ICON}       heart-filled
${CREATE_SEQUENCE}   1
${FEATURE_KEY_INPUT}    xpath=//span[contains(text(),'Feature Key')]/ancestor::div[contains(@class,'relative')]//div[contains(@class,'ant-select-selector')]
${ACTIVATE_INPUT}    xpath=//span[contains(text(),'Status')]/ancestor::div[contains(@class,'relative')]//div[contains(@class,'ant-select-selector')]

${EDIT_NAME_TH}      แก้ไข
${EDIT_NAME_EN}      Edit
${EDIT_PATH}         /Edit
${EDIT_DESCRIPTION}  แก้ไข
${EDIT_SEQUENCE}     2


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

Open SuperAdmin
    Start Login With SuperAdmin
    Wait Until Location Is    ${URL}combined/dashboard
    Click Element    xpath=(//button[@data-slot='tooltip-trigger'])[last()]

Wait And Click Child Menu Management Visible
    Wait Until Element Is Visible    ${Sub Menu Button}
    Click Element    ${Sub Menu Button}
    Wait Until Element Is Visible    ${Child Menu Button}
    Click Element    ${Child Menu Button}
    Wait Until Element Is Visible    ${Main Menu Button}
    Click Element    ${Main Menu Button}

Click Main Menu
    Wait Until Element Is Visible    ${Main Menu Button}
    Click Element    ${Main Menu Button}

Click Edit button
    Click Element    //tr[.//div[contains(normalize-space(.),'Test Create Main Menu')]]//button[.//*[contains(@class,'tabler-icon-edit')]]

Click Delete button
    Click Element    //tr[.//div[contains(normalize-space(.),'Test Create Main Menu')]]//button[.//*[contains(@class,'tabler-icon-trash')]]

Check Main Menu Value
    [Arguments]
    ...    ${name_en}=${CREATE_NAME_EN}
    ...    ${name_th}=${CREATE_NAME_TH}
    ...    ${path}=${CREATE_PATH}
    ...    ${description}=${CREATE_DESCRIPTION}
    ...    ${icon}=${CREATE_ICON}
    ...    ${sequence}=${CREATE_SEQUENCE}
    Textfield Value Should Be    ${NAME_EN}    ${name_en}
    Textfield Value Should Be    ${NAME_TH}    ${name_th}
    Textfield Value Should Be    ${PATH}    ${path}
    Textfield Value Should Be    ${DESCRIPTION}    ${description}
    Textfield Value Should Be    ${ICON}    ${icon}
    Textfield Value Should Be    ${SEQUENCE}    ${sequence}

Fill Main Menu Create Values
    Input Text    ${NAME_TH}    ${CREATE_NAME_TH}
    Input Text    ${NAME_EN}    ${CREATE_NAME_EN}
    Input Text    ${PATH}    ${CREATE_PATH}
    Input Text    ${DESCRIPTION}    ${CREATE_DESCRIPTION}
    Input Text    ${ICON}    heart
    Wait Until Element Is Visible    xpath=//button[@title='heart-filled']
    Click Button    xpath=//button[@title='heart-filled']
    Click Element    ${SEQUENCE}
    FOR    ${j}    IN RANGE    1    4
        Press Keys    ${SEQUENCE}    BACKSPACE
    END
    Input Text    ${SEQUENCE}    ${CREATE_SEQUENCE}

Fill Main Menu Edit Values
    Input Text    ${NAME_TH}    text=' ${EDIT_NAME_TH}'
    Input Text    ${NAME_EN}    text=' ${EDIT_NAME_EN}''
    Input Text    ${PATH}    ${EDIT_PATH}
    Input Text    ${DESCRIPTION}    ${EDIT_DESCRIPTION}
    Click Element    ${SEQUENCE}
    FOR    ${j}    IN RANGE    1    4
        Press Keys    ${SEQUENCE}    BACKSPACE
    END
    Input Text    ${SEQUENCE}    ${EDIT_SEQUENCE}