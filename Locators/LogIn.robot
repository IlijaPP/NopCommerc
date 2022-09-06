*** Variables ***
${LogInForm}      xpath=//div[@class='returning-wrapper fieldset']
${RegisterForm}    xpath=//div[@class='new-wrapper register-block']
${InputEmail}     id=Email
${InputPassword}    id=Password
${RememberMeCheckBox}    id=RememberMe
${ForgotPassword}    xpath=//a[@href='/passwordrecovery']
${LogInButton}    xpath=//button[@class='button-1 login-button']
${RegisterButton}    xpath=//button[@class='button-1 register-button']
${PasswordRecovery}    xpath=//*[text()='Password recovery']
${RecoveryEmailField}    xpath=//div[@class='inputs']/input
${RecoveryButton}    xpath=//button[@class='button-1 password-recovery-button']
${RecoveryAlert}    xpath=//p[@class='content']
${SuccessfulLogIn}    xpath=//div[@class='topic-block-title']
${LogInError}     xpath=//div[@class='message-error validation-summary-errors']/ul
${InvalidEmail}    id=Email-error
