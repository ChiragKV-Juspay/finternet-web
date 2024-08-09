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
  let (userData, setUserData) = React.useState(() => Js.Json.null)
  let (transactionsHistory, setTransactionsHistory) = React.useState(() => Js.Json.null)
  let (userAssets, setUserAssets) = React.useState(() => Js.Json.null)
  let (transactionResult, setTransactionResult) = React.useState(() => Js.Json.null)
  let (showAuthInitiated, setShowAuthInitiated) = React.useState(_ => false)
  let (showTransactionConfirm, setShowTrasactionConfirm) = React.useState(_ => false)

  let handlePrevScreen = () => {
    switch currentScreen {
    | Login => ()
    | Home => setCurrentScreen(_ => Login)
    | EnterAmount => setCurrentScreen(_ => Transfer)
    | EnterPin => setCurrentScreen(_ => EnterAmount)
    | Transfer => setCurrentScreen(_ => Home)
    | TransactionCompleted => setCurrentScreen(_ => EnterPin)
    }
  }

  let handleNextScreen = () => {
    switch currentScreen {
    | Login => setCurrentScreen(_ => Home)
    | Home => setCurrentScreen(_ => Transfer)
    | Transfer => setCurrentScreen(_ => EnterAmount)
    | EnterAmount => setCurrentScreen(_ => EnterPin)
    | EnterPin => setCurrentScreen(_ => TransactionCompleted)
    | TransactionCompleted => ()
    }
  }
  let fetchData = async () => {
    let endpoint = `https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId`
    let response = await Fetch.get(endpoint)
    let json = await response->Fetch.Response.json

    setUserData(_ => json)
  }
  let fetchUserAssets = async () => {
    let assetsEndpoint = `https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets`
    let response = await Fetch.get(assetsEndpoint)
    let json = await response->Fetch.Response.json
    setUserAssets(_ => json)
  }
  let fetchUserTransactionsHistory = async () => {
    let historyEndpoint = `https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets/123/history`
    let response = await Fetch.get(historyEndpoint)
    let json = await response->Fetch.Response.json
    setTransactionsHistory(_ => json)
  }
  let handleNavigateToHome = () => {
    setCurrentScreen(_ => Home)
    fetchData()->ignore
    fetchUserTransactionsHistory()->ignore
    fetchUserAssets()->ignore
  }
  let performTransfer = () => {
    let postTransfer = async () => {
      open Fetch

      let transferBody = {
        "sender": "arnab.d@unifiedledger1",
        "recipient": "ales@ledger",
        "asset": {
          "currency": "USD",
          "unit": 200,
          "token_manager": "tokenManagerAddress",
        },
        "signature": "signature",
      }

      let response = await fetch(
        "https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets/123/asset:transfer",
        {
          method: #POST,
          body: transferBody->Js.Json.stringifyAny->Belt.Option.getExn->Body.string,
          headers: Headers.fromObject({
            "Content-type": "application/json",
          }),
        },
      )

      let json = await response->Fetch.Response.json
      setTransactionResult(_ => json)
    }

    postTransfer()->ignore
  }
  let handleNavigateToTransactionCompleted = () => {
    setCurrentScreen(_ => TransactionCompleted)
    setShowTrasactionConfirm(_ => true)
    performTransfer()->ignore
  }
  let handleNavigateToEnterPin = () => {
    setCurrentScreen(_ => EnterPin)
    setShowAuthInitiated(_ => true)
  }

  let renderContent = () => {
    switch currentScreen {
    | Login => <Login onNavigateToHome={_ => handleNavigateToHome()} />
    | Home => <Home onNavigateToReceiversList={_ => setCurrentScreen(_ => Transfer)} />
    | Transfer => <Transfer onNavigateToEnterAmount={_ => setCurrentScreen(_ => EnterAmount)} />
    | EnterAmount => <EnterAmount onNavigateToEnterPin={_ => handleNavigateToEnterPin()} />
    | EnterPin =>
      <EnterPin onNavigateToTransactionCompleted={_ => handleNavigateToTransactionCompleted()} />
    | TransactionCompleted =>
      <TransactionCompleted onNavigateToHome={_ => setCurrentScreen(_ => Home)} />
    }
  }
  // <div>
  <div className="flex justify-center  h-screen w-screen flex-row  jc p-4  font-space-grotesk ">
    <div className="absolute top-4 left-4 flex flex-row gap-1">
      <img src="/finternetLogo.png" alt="Description of image" className="h-10 w-10" />
      <div className="self-center"> {React.string("Playground")} </div>
    </div>
    <div className="flex flex-col h-full w-1/5 justify-center gap-4">
      <div className="bg-white h-4/5 self-center w-full p-4 shadow-lg rounded-lg   overflow-auto ">
        {renderContent()}
      </div>
      <div className=" flex flex-row justify-around text-xl text-gray-400">
        <button onClick={_ => handlePrevScreen()}> {React.string("<")} </button>
        <button onClick={_ => handleNextScreen()}> {React.string(">")} </button>
      </div>
    </div>
    <div
      className="ml-4 p-4  bg-gray-100 rounded-lg w-3/5 h-full flex flex-col gap-3 overflow-auto">
      <div className="text-2xl"> {React.string("Domestic Transfer Activity Log")} </div>
      {userData != Js.Json.null
        ? <Accordion
            userData={userData}
            transactionsHistory={transactionsHistory}
            userAssets={userAssets}
            showAuthInitiated={showAuthInitiated}
            showTransactionConfirm={showTransactionConfirm}
            transactionResult={transactionResult}
          />
        : <div className="text-sm">
            {React.string("Initiate transaction to view activity logs")}
          </div>}
    </div>
  </div>
  // </div>
}
