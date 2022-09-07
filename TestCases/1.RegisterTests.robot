*** Settings ***
Test Setup        Open Application
Test Teardown     Close Application
Resource          ../KeyWords/SetupTearDown.robot
Resource          ../KeyWords/Register.robot

*** Test Cases ***
TC002-Register New User
    Open Register Page
    Generate Random Email
    Input Personal Details    ${FirstName}    ${LastName}    ${RandomEmail}
    Company Name
    Checkbox Newsletter
    Password Input    ${ValidPassword}
    Confirm password Input    ${ValidPassword}
    Click Register Button
    Verify New User Is Registered

TC003-Register User With Invalid Email
    Open Register Page
    Input Personal Details    ${FirstName}    ${LastName}    ${InvalidRegisterEmail}
    Company Name
    Checkbox Newsletter
    Password Input    ${ValidPassword}
    Confirm password Input    ${ValidPassword}
    Click Register Button
    Verify Wrong Email Error

TC004-Register With Used Email
    Open Register Page
    Input Personal Details    ${FirstName}    ${LastName}    ${RandomEmail}
    Company Name
    Checkbox Newsletter
    Password Input    ${ValidPassword}
    Confirm password Input    ${ValidPassword}
    Click Register Button
    Verify Already Used Email

TC005-Register User Without Confirm Password
    Open Register Page
    Input Personal Details    ${FirstName}    ${LastName}    ${RandomEmail}
    Company Name
    Checkbox Newsletter
    Password Input    ${ValidPassword}
    Click Register Button
    Verify Confirm Password    ${MissingConfirmPasswordText}

TC005-Register User Without Password
    Open Register Page
    Input Personal Details    ${FirstName}    ${LastName}    ${RandomEmail}
    Company Name
    Checkbox Newsletter
    Confirm password Input    ${ValidPassword}
    Click Register Button
    Verify Confirm Password    ${PasswordAndConfirmPasswordNotMatchText}

TC006-Register Without Password and Confirm Password
    Open Register Page
    Input Personal Details    ${FirstName}    ${LastName}    ${RandomEmail}
    Company Name
    Checkbox Newsletter
    Click Register Button
    Verify Password    ${MissingPasswordErrorText}
    Verify Confirm Password    ${MissingConfirmPasswordText}

TC007-Register With Invalid Password
    Open Register Page
    Input Personal Details    ${FirstName}    ${LastName}    ${RandomEmail}
    Company Name
    Checkbox Newsletter
    Password Input    ${InvalidPassword}
    Confirm password Input    ${ValidPassword}
    Click Register Button
    Verify Password    ${InvalidPasswordErrorText}
    Verify Confirm Password    ${PasswordAndConfirmPasswordNotMatchText}

TC008-Register User With Empty First Name
    Open Register Page
    Input Personal Details    ${EMPTY}    ${LastName}    ${RandomEmail}
    Company Name
    Checkbox Newsletter
    Password Input    ${ValidPassword}
    Confirm password Input    ${ValidPassword}
    Click Register Button
    Verify First Name

TC009-Register User With Empty Last Name
    Open Register Page
    Input Personal Details    ${FirstName}    ${EMPTY}    ${RandomEmail}
    Company Name
    Checkbox Newsletter
    Password Input    ${ValidPassword}
    Confirm password Input    ${ValidPassword}
    Click Register Button
    Verify Last Name
