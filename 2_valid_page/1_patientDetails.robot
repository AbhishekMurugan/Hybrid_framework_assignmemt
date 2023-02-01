*** Settings ***
Documentation       This file contains test cases for add valid patient
Resource    ../Resource/base/Common_functionalities.Resource
Library     DataDriver      file=../Test_Data/Caption_project.xlsx      sheet_name=Details

Test Setup      Launch Browser and Navigate To Url
Test Teardown       Close Browser
Test Template           add valid patient tamplate
*** Test Cases ***
TC1
TC2
TC3
*** Keywords ***
add valid patient tamplate
      [Arguments]     ${authUser}     ${clearPass}     ${languageChoice}      ${form_fname}       ${form_mname}
      ...     ${form_lname}       ${form_suffix}      ${form_DOB}     ${form_sex}     ${expected_data}
      Input Text    name=authUser    ${authUser}
      Input Password    name=clearPass    ${clearPass}
      Select From List By Label    name=languageChoice        ${languageChoice}
      Click Element    id=login-button
      Mouse Over    xpath=//div[@class='menuLabel px-1 dropdown-toggle oe-dropdown-toggle']
      Click Element    xpath=//div[text()='New/Search']
       Select Frame    xpath=//iframe[@name='pat']
       Input Text    id=form_fname    ${form_fname}
       Input Text    id=form_mname    ${form_mname}
       Input Text    id=form_lname    ${form_lname}
       Input Text    id=form_suffix     ${form_suffix}
       Input Text    name=form_DOB    ${form_DOB}
       Select From List By Label    name=form_sex      ${form_sex}
       Click Element    id=create
       Unselect Frame
       Select Frame    xpath=//iframe[@id='modalframe']
       Click Element    xpath=//input[@onclick='dlgclose("srcConfirmSave", false);']
       Sleep    15s
       ${alert_text}    Handle Alert   action=ACCEPT
       Log To Console     ${alert_text}

       Select Frame    xpath=//iframe[@name='pat']
       Element Should Contain    xpath=//h2[contains(text(),'Medical Record Dashboard')]       ${expected_data}