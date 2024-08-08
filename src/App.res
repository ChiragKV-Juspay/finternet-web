type screen =
  | Login
  | Home
  | EnterAmount
  | EnterPin
  | Transfer
  | TransactionCompleted
@react.component
let make = () => {
  let (currentScreen, setCurrentScreen) = React.useState(_ => Login)

  let renderContent = () => {
    switch currentScreen {
    | Login => <Login onNavigateToHome={_ => setCurrentScreen(_ => Home)} />
    //  onNavigateToSettings={() => setCurrentScreen(Settings)} />
    | Home => <Home onNavigateToReceiversList={_ => setCurrentScreen(_ => Transfer)} />
    | Transfer => <Transfer onNavigateToEnterAmount={_ => setCurrentScreen(_ => EnterAmount)} />
    | EnterAmount => <EnterAmount onNavigateToEnterPin={_ => setCurrentScreen(_ => EnterPin)} />
    | EnterPin =>
      <EnterPin
        onNavigateToTransactionCompleted={_ => setCurrentScreen(_ => TransactionCompleted)}
      />
    | TransactionCompleted =>
      <TransactionCompleted onNavigateToHome={_ => setCurrentScreen(_ => Home)} />

    // | Settings => <SettingsScreen.onNavigateHome={() => setCurrentScreen(Home)} />
    }
  }

  // <div className="flex flex-row   p-4 border border-gray-300 rounded-lg">
  <div
    className="flex justify-center  h-screen w-screen flex-row  jc p-4 border font-space-grotesk">
    <div className="bg-white h-4/5 self-center w-1/5 p-4 shadow-lg rounded-lg">
      {renderContent()}
      // {React.string("Content inside the mobile")}
    </div>
    <div className="ml-4 p-4  bg-gray-100 rounded-lg">
      <Accordion />
    </div>
  </div>
}
