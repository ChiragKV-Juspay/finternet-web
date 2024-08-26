// let bankAccountTokenization = "Bank Account Tokenization"
// let domesticMoneyTransfer = "Domestic Money Transfer"
// let propertyTokenization = "Property Tokenization"
// let loanAgainstProperty = "Loan Against Property"
// let helloWorld = "Hello World !"
// let finternetOnboarding = "Finternet Onboarding"
// let adminDashboard = "Admin Dashboard"

module MoneyUseCases = {
  let bankAccountTokenization = "Bank Account Tokenization"
  let domesticMoneyTransfer = "Domestic Money Transfer"
  let all = [bankAccountTokenization, domesticMoneyTransfer]
}

module PropertyUseCases = {
  let propertyTokenization = "Property Tokenization"
  let loanAgainstProperty = "Loan Against Property"
  let all = [propertyTokenization, loanAgainstProperty]
}

module WebHome = {
  let helloWorld = "Hello World !"
  let finternetOnboarding = "Finternet Onboarding"
  let all = [helloWorld, finternetOnboarding]
}

module TokenManager = {
  let adminDashboard = "Admin Dashboard"
  let all = [adminDashboard]
}

type strings = {}
