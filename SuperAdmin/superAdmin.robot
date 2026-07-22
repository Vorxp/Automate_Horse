*** Settings ***
Resource    resourses.robot

*** Test Cases ***
Create Main Menu
    Open SuperAdmin
    Wait Until Element Is Visible    ${Menu Management Button}
    Click Element    ${Menu Management Button}
    Wait And Click Child Menu Management Visible
    FOR    ${i}    IN    1   3
        Wait Until Element Is Visible    xpath=//button[normalize-space()='+ Add Main Menu']
        Click Element    xpath=//button[normalize-space()='+ Add Main Menu']
        Wait Until Element Is Visible    xpath=//div[@role='dialog']//h2[normalize-space()='Create Main Menus']
        Fill Main Menu Create Values
        Click Element    ${FEATURE_KEY_INPUT}
        Wait Until Element Is Visible    //div[contains(@class, 'ant-select-item-option') and @title='Customer']    timeout=10s
        Click Element    xpath=//div[contains(@class, 'ant-select-item-option') and @title='Customer']

        IF    ${i} == 1
            Click Button    ${CANCEL_BTN}
        ELSE
            Click Button    ${SAVE_BTN}
        END
        
    END
    Wait Until Element Is Visible    //a[@href='/combined/test-main-menu']
    Wait Until Element Is Visible    //tr[.//div[normalize-space(.)='Test Create Main Menu']]
    
    
Edit Main menu
    Open SuperAdmin
    Wait Until Element Is Visible    ${Menu Management Button}
    Click Element    ${Menu Management Button}
    Click Main Menu

    Wait Until Element Is Visible    //tr[.//div[contains(normalize-space(.), 'Test Create Main Menu')]]
    Click Edit button
    Wait Until Element Is Visible    xpath=//div[@role='dialog']//h2[normalize-space()='Edit Main Menus']
    Check Main Menu Value
    Fill Main Menu Edit Values

    Click Element    ${FEATURE_KEY_INPUT}
    Wait Until Element Is Visible    //div[contains(@class, 'ant-select-item-option') and @title='Customer']    timeout=10s
    Click Element    //div[contains(@class, 'ant-select-item-option') and @title='testing']

    Click Element    ${ACTIVATE_INPUT}
    Wait Until Element Is Visible    //div[contains(@class, 'ant-select-item-option') and @title='In Active']    timeout=10s
    Click Element    xpath=//div[contains(@class, 'ant-select-item-option') and @title='In Active']

    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'ant-select-item-option') and @title='Active']    timeout=10s
    Click Button    ${SAVE_BTN}    
    Wait Until Element Is Visible    //tr[.//div[normalize-space(.)='Test Create Main Menu Edit']]
    Close Browser
    
Delete Main Menu
    Open SuperAdmin
    Wait Until Element Is Visible    ${Menu Management Button}
    Click Element    ${Menu Management Button}
    Click Main Menu
    Wait Until Element Is Visible    //tr[.//div[contains(normalize-space(.), 'Test Create Main Menu')]]

    FOR    ${i}    IN    1    3
        Click Delete button
        Wait Until Element Is Visible    xpath=//div[@role='dialog']//h2[normalize-space()='Delete Data']
        
        IF    ${i} == 1
            Click Button    ${CANCEL_BTN}
        ELSE
            Click Button    ${CONFRIM_BTN}
        END
    END
    Wait Until Element Is Not Visible    //tr[.//div[contains(normalize-space(.), 'Test Create Main Menu')]]
    Close Browser

# Read Data From Menu Management
#     Open SuperAdmin
#     Wait Until Element Is Visible    ${Menu Management Button}
#     Click Element    ${Menu Management Button}
#     Wait And Click Child Menu Management Visible
#     Sleep    2s
#     Click Element    xpath=//button[.//svg[contains(@class,'lucide-chevron-down')]]    # ตรงนี้ยังไม่ผ่าน หาปุ่มไม่เจอ


#     Wait Until Element Is Visible    xpath=//*[@role='listbox']
#     Click Element    xpath=//*[@role='option'][.//span[normalize-space()='50']]
    
#     ${rows}=    Get Element Count    xpath=//tbody/tr

#     FOR    ${i}    IN RANGE    1    ${rows+1}

#         ${menu}=    Get Text   xpath=(//tbody/tr)[${i}]/td[2]

#         ${sequence}=    Get Text   xpath=(//tbody/tr)[${i}]/td[6]

#         Log To Console    ${i} : ${menu} : ${sequence}

#     END