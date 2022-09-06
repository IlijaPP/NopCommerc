*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../Resources/TestData.robot
Resource          ../Locators/Header.robot
Resource          ../Locators/Register.robot

*** KeyWords ***
Open Register Page
    Click Element    ${Register}

Generate Random Email
    ${RandomString}    String.Generate Random String    14    [NUMBERS]abcdef
    ${RandomEmail}    Catenate    ${RandomString}@gmail.com
    Set Global Variable    ${RandomEmail}
    [Return]    ${RandomEmail}

Input Personal Details
    [Arguments]    ${arg1}    ${arg2}    ${arg3}
    Click Element    ${SexMale}
    Input Text    ${InputRegisterName}    ${arg1}
    Input Text    ${InputRegisterLastName}    ${arg2}
    Select From List By Value    ${DayOfBirth}    30
    Select From List By Label    ${MonthOfBirth}    July
    Select From List By Label    ${YearOfBirth}    1992
    Input Text    ${RegisterEmail}    ${arg3}

Company Name
    Input Text    ${InputCompany}    ${CompanyName}

Checkbox Newsletter
    Select Checkbox    ${NewsLetterCheckbox}

Password Input
    [Arguments]    ${arg1}
    Input Password    ${InputPassword}    ${arg1}

Confirm Password Input
    [Arguments]    ${arg1}
    Input Password    ${InputConfirmPassword}    ${arg1}

Click Register Button
    Click Button    ${RegisterButton}

Verify New User Is Registered
    Element Should Be Visible    ${SuccessfulRegistration}
    Element Text Should Be    ${SuccessfulRegistration}    ${SuccessfullRegistrationText}

Verify Wrong Email Error
    Element Should Contain    ${WrongEmailError}    ${InvalidRegisterEmailError}

Verify Already Used Email
    Element Text Should be    ${UsedEmailError}    ${UsedEmailErrorText}

Verify Confirm Password
    [Arguments]    ${arg1}
    Element Text Should be    ${MissingConfirmPassword}    ${arg1}

Verify Password
    [Arguments]    ${arg1}
    Element Text Should be    ${MissingPassword}    ${arg1}

Verify First Name
    Element Text Should be    ${FirstNameError}    ${FirstNameErrorText}

Verify Last Name
    Element Text Should be    ${LastNameError}    ${LastNameErrorText}
