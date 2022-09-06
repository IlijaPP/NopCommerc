*** Variables ***
${SexMale}        id=gender-male
${SexFemale}      id=gender-female
${InputRegisterName}    id=FirstName
${InputRegisterLastName}    id=LastName
${DayOfBirth}     name=DateOfBirthDay
${MonthOfBirth}    name=DateOfBirthMonth
${YearOfBirth}    name=DateOfBirthYear
${RegisterEmail}    id=Email
${InputCompany}    id=Company
${NewsLetterCheckbox}    id=Newsletter
${InputPassword}    id=Password
${InputConfirmPassword}    id=ConfirmPassword
${RegisterButton}    name=register-button
${SuccessfulRegistration}    xpath=//div[@class='result']
${WrongEmailError}    xpath=//*[text()='Wrong email']
${UsedEmailError}    xpath=//div[@class='message-error validation-summary-errors']
${MissingConfirmPassword}    id=ConfirmPassword-error
${MissingPassword}    id=Password-error
${FirstNameError}    id=FirstName-error
${LastNameError}    id=LastName-error
