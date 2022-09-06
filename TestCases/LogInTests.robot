*** Settings ***
Test Setup        Open Application
Test Teardown     Close Application
Resource          ../KeyWords/SetupTearDown.robot
Resource          ../KeyWords/LogIn.robot

*** Test Cases ***
TC002-LogInWithValidCredentials
    Open LogIn Page
    Input Credentials    ${RandomEmail}    ${ValidPassword}
    Verify User Is Loged In

TC003LogInWithInvalidPassword
    Open LogIn Page
    Input Credentials    ${RandomEmail}    ${InvalidLogInPassword}
    Verify User Is Not Logged In    ${ErrorIncorectCredentials}

TC004LogInWithInvalidEmail
    Open LogIn Page
    Input Credentials    ${InvalidLogInEmail}    ${ValidPassword}
    Verify User Is Not Logged In    ${NoCustumerError}

TC005-LogInWithInvalidCredentials
    Open LogIn Page
    Input Credentials    ${InvalidLogInEmail}    ${InvalidLogInPassword}
    Verify User Is Not Logged In    ${NoCustumerError}

TC006-LogInWithEmptyCredentials
    Open LogIn Page
    Input Credentials    ${EMPTY}    ${EMPTY}
    LogIn With Invalid Credential    ${EmptyCredentialsError}

TC007-LogInWithEmptyPassword
    Open LogIn Page
    Input Credentials    ${RandomEmail}    ${EMPTY}
    Verify User Is Not Logged In    ${ErrorIncorectCredentials}

TC008-LogInWithEmptyEmail
    Open LogIn Page
    Input Credentials    ${EMPTY}    ${ValidPassword}
    LogIn With Invalid Credential    ${EmptyCredentialsError}

TC009-ForgetPasswordLink
    Open LogIn Page
    Forgot Password    ${RandomEmail}    ${RecoverySuccessfulText}

LogInWithInvalidEmailFormat
    Open LogIn Page
    LogIn With Invalid Credential    ${EmptyCredentialsError}
