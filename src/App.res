type domesticMoneyTransferScreens =
  | Login
  | Home
  | EnterAmount
  | EnterPin
  | Transfer
  | TransactionCompleted

type onboardingScreens =
  | OnboardingLogin
  | VerifyIdentity
  | FaceID
  | QRScreen
  | LinkBankAccount
  | BankAccountLinked

@react.component
let make = () => {
  let (currentOnboardingScreen, setCurrentOnboardingScreen) = React.useState(_ => OnboardingLogin)
  let (currentTransferScreen, setCurrentTransferScreen) = React.useState(_ => Login)
  let (selectedOption, setSelectedOption) = React.useState(_ => "User Onboarding")

  let (userData, setUserData) = React.useState(() => Js.Json.null)
  let (transactionsHistory, setTransactionsHistory) = React.useState(() => Js.Json.null)
  let (userAssets, setUserAssets) = React.useState(() => Js.Json.null)
  let (transactionResult, setTransactionResult) = React.useState(() => Js.Json.null)
  let (showAuthInitiated, setShowAuthInitiated) = React.useState(_ => false)
  let (showTransactionConfirm, setShowTrasactionConfirm) = React.useState(_ => false)
  let (registerStartResponse, setRegisterStartResponse) = React.useState(() => Js.Json.null)
  let (attestation, setAttestation) = React.useState(() => Js.Json.null)

  let (openDrawer, setOpenDrawer) = React.useState(_ => false)

  React.useEffect(() => {
    Console.log("njacsjascjn")
    Console.log(registerStartResponse)
    None
  }, [registerStartResponse])

  let handlePrevScreen = () => {
    switch currentTransferScreen {
    | Login => ()
    | Home => setCurrentTransferScreen(_ => Login)
    | EnterAmount => setCurrentTransferScreen(_ => Transfer)
    | EnterPin => setCurrentTransferScreen(_ => EnterAmount)
    | Transfer => setCurrentTransferScreen(_ => Home)
    | TransactionCompleted => setCurrentTransferScreen(_ => EnterPin)
    }
  }

  let handleNextScreen = () => {
    switch currentTransferScreen {
    | Login => setCurrentTransferScreen(_ => Home)
    | Home => setCurrentTransferScreen(_ => Transfer)
    | Transfer => setCurrentTransferScreen(_ => EnterAmount)
    | EnterAmount => setCurrentTransferScreen(_ => EnterPin)
    | EnterPin => setCurrentTransferScreen(_ => TransactionCompleted)
    | TransactionCompleted => ()
    }
  }

  let handlePrevOnboardingScreen = () => {
    switch currentOnboardingScreen {
    | OnboardingLogin => ()
    | VerifyIdentity => setCurrentOnboardingScreen(_ => OnboardingLogin)
    | FaceID => setCurrentOnboardingScreen(_ => VerifyIdentity)
    | QRScreen => setCurrentOnboardingScreen(_ => FaceID)
    | LinkBankAccount => setCurrentOnboardingScreen(_ => QRScreen)
    | BankAccountLinked => setCurrentOnboardingScreen(_ => LinkBankAccount)
    }
  }

  let handleNextOnboardingScreen = () => {
    switch currentOnboardingScreen {
    | OnboardingLogin => setCurrentOnboardingScreen(_ => VerifyIdentity)
    | VerifyIdentity => setCurrentOnboardingScreen(_ => FaceID)
    | FaceID => setCurrentOnboardingScreen(_ => QRScreen)
    | QRScreen => setCurrentOnboardingScreen(_ => LinkBankAccount)
    | LinkBankAccount => setCurrentOnboardingScreen(_ => BankAccountLinked)
    | BankAccountLinked => ()
    }
  }

  let fetchData = async () => {
    let endpoint = `https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId`
    let response = await Fetch.get(endpoint)
    let json = await response->Fetch.Response.json
    Js.log(json)
    setUserData(_ => json)
  }
  let fetchUserAssets = async () => {
    let assetsEndpoint = `https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets`
    let response = await Fetch.get(assetsEndpoint)
    let json = await response->Fetch.Response.json
    Js.log(json)

    setUserAssets(_ => json)
  }

  let simpleWebAuthn = async () => {
    open Fetch
    // https://webauthn-fin-production.up.railway.app/api/passkey/registerStart
    let transferBody = {"username": "arnab.d"}
    let response = await fetch(
      "https://webauthn-fin-production.up.railway.app/api/passkey/registerStart",
      {
        method: #POST,
        body: transferBody->Js.Json.stringifyAny->Belt.Option.getExn->Body.string,
        headers: Headers.fromObject({
          "Content-type": "application/json",
        }),
      },
    )
    let json = await response->Fetch.Response.json
    setRegisterStartResponse(_ => json)

    let attestationResponse = await SimpleWebAuthnTypes.startRegistration(json)
    setAttestation(_ => attestationResponse)

    Console.log(attestationResponse)
    let registerFinishResponse = await fetch(
      "https://webauthn-fin-production.up.railway.app/api/passkey/registerFinish",
      {
        method: #POST,
        body: attestationResponse->Js.Json.stringifyAny->Belt.Option.getExn->Body.string,
        headers: Headers.fromObject({
          "Content-type": "application/json",
        }),
      },
    )
    Console.log(registerFinishResponse)
  }
  let fetchUserTransactionsHistory = async () => {
    let historyEndpoint = `https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets/123/history`
    let response = await Fetch.get(historyEndpoint)
    let json = await response->Fetch.Response.json
    Js.log(json)

    setTransactionsHistory(_ => json)
  }
  let handleNavigateToHome = () => {
    setCurrentTransferScreen(_ => Home)
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
    setCurrentTransferScreen(_ => TransactionCompleted)
    setShowTrasactionConfirm(_ => true)
    performTransfer()->ignore
  }
  let handleNavigateToEnterPin = () => {
    setCurrentTransferScreen(_ => EnterPin)
    setShowAuthInitiated(_ => true)
  }
  let handleNavigateToVerfiyIdentity = () => {
    setCurrentOnboardingScreen(_ => VerifyIdentity)
  }

  let handleNavigateToFaceID = () => {
    setCurrentOnboardingScreen(_ => FaceID)
    simpleWebAuthn()
    ->Promise.then(_ => {
      setCurrentOnboardingScreen(_ => QRScreen)
      Js.Promise.resolve()
    })
    ->ignore
  }

  let renderTransferContent = () => {
    switch currentTransferScreen {
    | Login => <Login onNavigateToHome={_ => handleNavigateToHome()} />
    | Home => <Home onNavigateToReceiversList={_ => setCurrentTransferScreen(_ => Transfer)} />
    | Transfer =>
      <Transfer onNavigateToEnterAmount={_ => setCurrentTransferScreen(_ => EnterAmount)} />
    | EnterAmount => <EnterAmount onNavigateToEnterPin={_ => handleNavigateToEnterPin()} />
    | EnterPin =>
      <EnterPin onNavigateToTransactionCompleted={_ => handleNavigateToTransactionCompleted()} />
    | TransactionCompleted =>
      <TransactionCompleted onNavigateToHome={_ => setCurrentTransferScreen(_ => Home)} />
    }
  }

  let renderOnboardingContent = () => {
    switch currentOnboardingScreen {
    | OnboardingLogin =>
      <OnboardingLogin onNavigateToVerifyIdentity={_ => handleNavigateToVerfiyIdentity()} />
    | VerifyIdentity => <VerifyIdentity onNavigateToFaceID={_ => handleNavigateToFaceID()} />
    | FaceID => <FaceID />
    | QRScreen =>
      <QRScreen
        onNavigateToLinkBankAccount={_ => setCurrentOnboardingScreen(_ => LinkBankAccount)}
      />
    | LinkBankAccount =>
      <LinkBankAccount
        onNavigateToBankAccountLinked={_ => setCurrentOnboardingScreen(_ => BankAccountLinked)}
      />
    | BankAccountLinked => <BankAccountLinked />
    }
  }
  let handleDrawerSelection = selectedOption => {
    Console.log(selectedOption)
    switch selectedOption {
    | "User Onboarding" =>
      // setCurrentOnboardingScreen(_ => OnboardingLogin)
      setSelectedOption(_ => "User Onboarding")
    | "Domestic Money Transfer" =>
      // setCurrentTransferScreen(_ => Login)
      setSelectedOption(_ => "Domestic Money Transfer")
    }
  }

  let handleLogoClick = () => {
    setOpenDrawer(_ => true)
  }
  <div>
    <div
      //  className="absolute top-4 left-4 flex flex-row gap-1"
      className="flex justify-between items-center px-10 py-2 shadow">
      <div className="flex">
        <img
          src="/finternetLogo.png"
          alt="Description of image"
          className="h-10 w-10"
          onClick={_ => handleLogoClick()}
        />
        <div className="self-center"> {React.string("Playground")} </div>
      </div>
      // <GitHubIcon />
      <a href="https://github.com/finternet-io" target="_blank" rel="noopener noreferrer">
        <GitHubIcon />
      </a>
    </div>
    <div className="flex justify-center  h-screen w-screen flex-row  jc p-4  font-space-grotesk ">
      <div className="flex flex-col h-full w-1/5 justify-center gap-4">
        <div
          className="bg-white h-4/5 self-center w-full p-4 shadow-lg rounded-lg   overflow-auto ">
          // {renderTransferContent()}
          // {renderOnboardingContent()}
          {switch selectedOption {
          | "User Onboarding" => renderOnboardingContent()
          | "Domestic Money Transfer" => renderTransferContent()
          }}
        </div>
        <div className="flex flex-row justify-around text-xl text-gray-400">
          <button
            onClick={_ => {
              switch selectedOption {
              | "User Onboarding" => handlePrevOnboardingScreen()
              | "Domestic Money Transfer" => handlePrevScreen()
              }
            }}>
            {React.string("<")}
          </button>
          <button
            onClick={_ => {
              switch selectedOption {
              | "User Onboarding" => handleNextOnboardingScreen()
              | "Domestic Money Transfer" => handleNextScreen()
              }
            }}>
            {React.string(">")}
          </button>
        </div>
      </div>
      <div
        className="ml-4 p-4  bg-gray-100 rounded-lg w-3/5 h-full flex flex-col gap-3 overflow-auto">
        <div className="text-2xl">
          {switch selectedOption {
          | "User Onboarding" => React.string("User Onboarding Activity Log (WIP)")
          | "Domestic Money Transfer" => React.string("Domestic Transfer Activity Log")
          }}
          // {React.string("Domestic Transfer Activity Log")}
        </div>
        // {userData != Js.Json.null
        // ?
        <Accordion
          userData={userData}
          transactionsHistory={transactionsHistory}
          userAssets={userAssets}
          showAuthInitiated={showAuthInitiated}
          showTransactionConfirm={showTransactionConfirm}
          transactionResult={transactionResult}
          flowType={selectedOption}
          registerStartResponse={registerStartResponse}
          attestation={attestation}
        />
        // :
        //  <div className="text-sm">
        // {React.string("Initiate transaction to view activity logs")}
        // </div>}
      </div>
      // <Drawer />

      <Drawer
        openDrawer={openDrawer}
        setOpenDrawer={setOpenDrawer}
        handleDrawerSelection={handleDrawerSelection}
      />
    </div>
  </div>
}
