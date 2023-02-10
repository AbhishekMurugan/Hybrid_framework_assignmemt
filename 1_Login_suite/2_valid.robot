*** Settings ***

Documentation           This file contains test cases related to valid login

Resource    ../Resource/base/Common_functionalities.Resource
Library     DataDriver      file=../Test_Data/Caption_project.xlsx      sheet_name=Valid_Login
Test Setup      Launch Browser and Navigate To Url
Test Teardown       Close Browser
Test Template       valid login template
*** Test Cases ***
TC1
*** Keywords ***
valid login template
    [Arguments]     ${authUser}     ${clearPass}     ${languageChoice}
    Input Text    name=authUser    ${authUser}
    Input Password    name=clearPass    ${clearPass}
    Select From List By Label    name=languageChoice        ${languageChoice}
    Click Element    id=login-button
    Mouse Over    xpath=//div[@class='menuLabel px-1 dropdown-toggle oe-dropdown-toggle']
    Click Element   xpath=//div[text()='New/Search']
