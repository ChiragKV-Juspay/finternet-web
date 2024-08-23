open Colors

@react.component
let make = (~handleNavigate) => {
  <div>
    <Header isFinternet={true} />
    <AccountCard iconColor=colors.black />
    <div className="my-2"> {React.string("Bank Accounts")} </div>
    <BankAccountCard handleNavigate={_ => handleNavigate()} />
    <div className="my-2"> {React.string("All Transactions")} </div>
    <TransactionsList />
  </div>
}
