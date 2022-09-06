*** Settings ***
Library           SeleniumLibrary
Resource          ../Locators/Header.robot
Resource          ../Locators/LogIn.robot
Resource          ../Resources/TestData.robot

*** KeyWords ***
Open LogIn Page
    Click Element    ${LogIn}
    Element Should Be Visible    ${LogInForm}

Input Credentials
    [Arguments]    ${arg1}    ${arg2}
    Input Text    ${InputEmail}    ${arg1}
    Input Password    ${InputPassword}    ${arg2}
    Wait Until Element Is Visible    ${LogInButton}

RememberMe CheckBox
    Select Checkbox    ${RememberMeCheckBox}
    Checkbox Should Be Selected    ${RememberMeCheckBox}

Forgot Password
    [Arguments]    ${arg1}    ${arg2}
    Click Element    ${ForgotPassword}
    Element Text Should Be    ${PasswordRecovery}    ${PasswordRecoveryText}
    Input Text    ${RecoveryEmailField}    ${arg1}
    Click Button    ${RecoveryButton}
    Element Should Contain    ${RecoveryAlert}    ${arg2}

Verify User Is Loged In
    Click Button    ${LogInButton}
    Element Should Contain    ${SuccessfulLogIn}    ${SuccessfulLogInText}

Verify User Is Not Logged In
    [Arguments]    ${arg1}
    Click Button    ${LogInButton}
    Element Should Contain    ${LogInError}    ${arg1}

LogIn With Invalid Credential
    [Arguments]    ${arg1}
    Click Button    ${LogInButton}
    Wait Until Element Is Visible    ${InvalidEmail}
    Element Should Contain    ${InvalidEmail}    ${arg1}
