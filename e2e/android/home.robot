*** Settings ***
Library             AppiumLibrary
Suite Teardown      Close All Applications

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME_ANDROID}    Android
${DEVICE_NAME_ANDROID}    emulator-5554
${APP_ANDROID}    /Users/pornsakp/Documents/playspace/FLUTTER/apps/currency_convertor/build/app/outputs/apk/debug/app-debug.apk
${AUTOMATION_NAME}    appium
${NUMPAD_1}     //android.view.View[@content-desc="1"]
${NUMPAD_2}     //android.view.View[@content-desc="2"]
${NUMPAD_3}     //android.view.View[@content-desc="3"]
${SEARCH_BUTTON}     //android.view.View[@index="15"]
${SEARCH_INPUT}     class=android.widget.EditText

*** Test Cases ***
Open Android app
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    deviceName=${DEVICE_NAME_ANDROID}    app=${APP_ANDROID}    automationName=${AUTOMATION_NAME}
    Wait Activity   .MainActivity    15
    Wait Until Page Contains    Currency Convertor     timeout=15s
    # Click Element   ${LOGIN_BUTTON}
    # Wait Until Page Contains    ต่อไป
    # Close All Applications

Enter Number 123
    Click Element   ${NUMPAD_1}
    Click Element   ${NUMPAD_2}
    Click Element   ${NUMPAD_3}
    Sleep   2s
    Page Should Contain Text   123

Search Currency THB
    Click Element   ${SEARCH_BUTTON}
    Wait Until Page Contains     AED    timeout=15s
    Click Element      ${SEARCH_INPUT}   
    Sleep   2s
    Press Keycode   48                   
    Press Keycode   36                    
    Press Keycode   30        
    Press Keycode   66           
    Sleep   2s
    Page Should Contain Text   Thai Baht