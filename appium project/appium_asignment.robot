*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
TC1
    [Documentation]     #working with native app
    Open Application    remote_url=http://localhost:4723/wd/hub
    ...     platformName=android
    ...     deviceName=vivo
    ...     appPackage=com.myntra.android
    ...     appActivity=com.myntra.android.SplashActivity
    ...     noReset=true

    Set Appium Timeout    30s
    Run Keyword And Ignore Error    Wait Until Page Contains Element      xpath=//android.widget.Button[@content-desc="tabButton_categories"]
    Run Keyword And Ignore Error     Click Element          xpath=//android.widget.Button[@content-desc="tabButton_categories"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="MEN"]
    Click Element    xpath=//android.widget.TextView[@text="MEN"]
    Wait Until Page Contains Element        xpath=//android.widget.TextView[@text="Topwear"]
    Click Element    xpath=//android.widget.TextView[@text="Topwear"]

    ${count}        Get Matching Xpath Count    xpath=//*[@text="Clothing Fabric"]
    WHILE    ${count}==0
        Swipe By Percent    90    70    90    20
        ${count}    Get Matching Xpath Count    xpath=//*[@text="Clothing Fabric"]

    END
    Click Element    xpath=//*[@text="Clothing Fabric"]
    Wait Until Page Contains Element    xpath=//(//android.view.ViewGroup[@content-desc="image_image_container"])
    Click Element    xpath=//(//android.view.ViewGroup[@content-desc="image_image_container"])
    Wait Until Page Contains Element    xpath=//android.view.ViewGroup[@content-desc="buy_button"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="buy_button"]
    Wait Until Page Contains Element    xpath=//android.view.ViewGroup[@content-desc="bag"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="bag"]
    Wait Until Page Contains Element    xpath=//android.view.View[@content-desc="LOGIN NOW"]
    Click Element    xpath=//android.view.View[@content-desc="LOGIN NOW"]
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@content-desc="mobile"]
    Click Element    xpath=//android.widget.EditText[@content-desc="mobile"]
    Input Text    xpath=//android.widget.EditText[@content-desc="mobile"]    234567890
    Wait Until Page Contains Element    xpath=//android.view.ViewGroup[@content-desc="form-button"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="form-button"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView
    Element Should Contain Text      xpath=//*[contains(@text,'valid')]         Please enter a valid mobile number



