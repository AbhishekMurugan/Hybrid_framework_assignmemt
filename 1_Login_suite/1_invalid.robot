*** Settings ***
Documentation
Resource    ../Resource/base/Common_functionalities.Resource
Library     DataDriver      file=../Test_Data/Caption_project.xlsx      sheet_name=Invalid_Login
Test Setup      Launch Browser and Navigate To Url
Test Teardown       Close Browser
Test Template       Invalid login template
*** Test Cases ***
TC1
*** Keywords ***
Invalid login template
    [Arguments]     ${authUser}     ${clearPass}     ${languageChoice}      ${expected_error}
    Input Text    name=authUser    ${authUser}
    Input Password    name=clearPass    ${clearPass}
    Select From List By Label    name=languageChoice        ${languageChoice}
    Click Element    id=login-button
    Element Should Contain    xpath=//div[@class='bg-danger text-light py-2 px-3 login-failure mb-3 font-weight-bold']      ${expected_error}