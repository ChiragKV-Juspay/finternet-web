type domesticMoneyTransferScreens =
  | Login
  | Home
  | EnterAmount
  | FaceID
  | EnterPin
  | Transfer
  | TransactionCompleted

type finternetOnboardingScreens =
  | OnboardingLogin
  | CreateAccount
  | FaceID
  | QRScreen

type onboardingScreens =
  | OnboardingLogin
  | CreateAccount
  | FaceID
  | QRScreen
  | LinkBankAccount
  | BankAccountLinked

type loanAgainstPropertyScreens =
  | PropertyHome
  | LinkProperty
  | LinkedHome
  | LoanSteps
  | SelectBankForLoan
  | FillLoanApplication
  | LinkCredentials
  | CheckEligibility
  | LoanSanctionedSuccessfully

@react.component
let make = () => {
  let (currentOnboardingScreen, setCurrentOnboardingScreen) = React.useState(_ => OnboardingLogin)
  let (currentTransferScreen, setCurrentTransferScreen) = React.useState(_ => Login)
  let (currentLoanAgainstPropertyScreen, setCurrentLoanAgainstPropertyScreen) = React.useState(_ =>
    PropertyHome
  )
  let (currentFinternetOnboardingScreen, setCurrentFinternetOnboardingScreen) = React.useState(_ =>
    OnboardingLogin
  )

  let (selectedOption, setSelectedOption) = React.useState(_ => "Hello World!")

  let (userData, setUserData) = React.useState(() => Js.Json.null)
  let (transactionsHistory, setTransactionsHistory) = React.useState(() => Js.Json.null)
  let (userAssets, setUserAssets) = React.useState(() => Js.Json.null)
  let (transactionResult, setTransactionResult) = React.useState(() => Js.Json.null)
  let (showAuthInitiated, setShowAuthInitiated) = React.useState(_ => false)
  let (showTransactionConfirm, setShowTrasactionConfirm) = React.useState(_ => false)
  let (registerStartResponse, setRegisterStartResponse) = React.useState(() => Js.Json.null)
  let (attestation, setAttestation) = React.useState(() => Js.Json.null)

  let (isCollapsed, setIsCollapsed) = React.useState(_ => false)

  let toggleCollapse = () => {
    setIsCollapsed(prev => !prev)
  }

  let handlePrevScreen = () => {
    switch currentTransferScreen {
    | Login => ()
    | Home => setCurrentTransferScreen(_ => Login)
    | Transfer => setCurrentTransferScreen(_ => Home)
    | EnterAmount => setCurrentTransferScreen(_ => Transfer)
    | FaceID => setCurrentTransferScreen(_ => EnterAmount)
    // | EnterPin => setCurrentTransferScreen(_ => EnterAmount)
    | TransactionCompleted => setCurrentTransferScreen(_ => FaceID)
    }
  }

  let handleNextScreen = () => {
    switch currentTransferScreen {
    | Login => setCurrentTransferScreen(_ => Home)
    | Home => setCurrentTransferScreen(_ => Transfer)
    | Transfer => setCurrentTransferScreen(_ => EnterAmount)
    | EnterAmount => setCurrentTransferScreen(_ => FaceID)
    | FaceID => setCurrentTransferScreen(_ => TransactionCompleted)

    // | EnterPin => setCurrentTransferScreen(_ => TransactionCompleted)
    | TransactionCompleted => ()
    }
  }

  let handlePrevOnboardingScreen = () => {
    switch currentOnboardingScreen {
    | OnboardingLogin => ()
    | CreateAccount => setCurrentOnboardingScreen(_ => OnboardingLogin)
    | FaceID => setCurrentOnboardingScreen(_ => CreateAccount)
    | QRScreen => setCurrentOnboardingScreen(_ => FaceID)
    | LinkBankAccount => setCurrentOnboardingScreen(_ => QRScreen)
    | BankAccountLinked => setCurrentOnboardingScreen(_ => LinkBankAccount)
    }
  }

  let handleNextOnboardingScreen = () => {
    switch currentOnboardingScreen {
    | OnboardingLogin => setCurrentOnboardingScreen(_ => CreateAccount)
    | CreateAccount => setCurrentOnboardingScreen(_ => FaceID)
    | FaceID => setCurrentOnboardingScreen(_ => QRScreen)
    | QRScreen => setCurrentOnboardingScreen(_ => LinkBankAccount)
    | LinkBankAccount => setCurrentOnboardingScreen(_ => BankAccountLinked)
    | BankAccountLinked => ()
    }
  }
  let handlePrevFinternetOnboardingScreen = () => {
    switch currentFinternetOnboardingScreen {
    | OnboardingLogin => ()
    | CreateAccount => setCurrentFinternetOnboardingScreen(_ => OnboardingLogin)
    | FaceID => setCurrentFinternetOnboardingScreen(_ => CreateAccount)
    | QRScreen => setCurrentFinternetOnboardingScreen(_ => FaceID)
    }
  }

  let handleNextFinternetOnboardingScreen = () => {
    switch currentFinternetOnboardingScreen {
    | OnboardingLogin => setCurrentFinternetOnboardingScreen(_ => CreateAccount)
    | CreateAccount => setCurrentFinternetOnboardingScreen(_ => FaceID)
    | FaceID => setCurrentFinternetOnboardingScreen(_ => QRScreen)
    | QRScreen => ()
    }
  }
  let handlePrevLoanAgainstPropertyScreen = () => {
    switch currentLoanAgainstPropertyScreen {
    | PropertyHome => ()
    | LinkProperty => setCurrentLoanAgainstPropertyScreen(_ => PropertyHome)
    | LinkedHome => setCurrentLoanAgainstPropertyScreen(_ => LinkProperty)
    | LoanSteps => setCurrentLoanAgainstPropertyScreen(_ => LinkedHome)
    | SelectBankForLoan => setCurrentLoanAgainstPropertyScreen(_ => LoanSteps)
    | FillLoanApplication => setCurrentLoanAgainstPropertyScreen(_ => SelectBankForLoan)
    | LinkCredentials => setCurrentLoanAgainstPropertyScreen(_ => FillLoanApplication)
    | CheckEligibility => setCurrentLoanAgainstPropertyScreen(_ => LinkCredentials)
    | LoanSanctionedSuccessfully => setCurrentLoanAgainstPropertyScreen(_ => CheckEligibility)
    }
  }

  let handleNextLoanAgainstPropertyScreen = () => {
    switch currentLoanAgainstPropertyScreen {
    | PropertyHome => setCurrentLoanAgainstPropertyScreen(_ => LinkProperty)
    | LinkProperty => setCurrentLoanAgainstPropertyScreen(_ => LinkedHome)
    | LinkedHome => setCurrentLoanAgainstPropertyScreen(_ => LoanSteps)
    | LoanSteps => setCurrentLoanAgainstPropertyScreen(_ => SelectBankForLoan)
    | SelectBankForLoan => setCurrentLoanAgainstPropertyScreen(_ => FillLoanApplication)
    | FillLoanApplication => setCurrentLoanAgainstPropertyScreen(_ => LinkCredentials)
    | LinkCredentials => setCurrentLoanAgainstPropertyScreen(_ => CheckEligibility)
    | CheckEligibility => setCurrentLoanAgainstPropertyScreen(_ => LoanSanctionedSuccessfully)

    | LoanSanctionedSuccessfully => ()
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
    let transferBody = {"username": "arnab.b"}
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

    // Console.log(attestationResponse)
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
    // Console.log(registerFinishResponse)
  }
  let fetchUserTransactionsHistory = async () => {
    let historyEndpoint = `https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets/123/history`
    let response = await Fetch.get(historyEndpoint)
    let json = await response->Fetch.Response.json
    Js.log(json)

    setTransactionsHistory(_ => json)
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
  let handleNavigateToHome = () => {
    setCurrentTransferScreen(_ => Home)
    fetchData()->ignore
    fetchUserTransactionsHistory()->ignore
    fetchUserAssets()->ignore
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
    setCurrentOnboardingScreen(_ => CreateAccount)
  }

  // let handleNavigateToFaceID = (~isFinternetOnboarding=false) => {
  //   isFinternetOnboarding
  //     ? setCurrentFinternetOnboardingScreen(_ => FaceID)
  //     : setCurrentOnboardingScreen(_ => FaceID)
  //   simpleWebAuthn()
  //   ->Promise.then(_ => {
  //     isFinternetOnboarding
  //       ? setCurrentFinternetOnboardingScreen(_ => QRScreen)
  //       : setCurrentOnboardingScreen(_ => QRScreen)
  //     Js.Promise.resolve()
  //   })
  //   ->ignore
  // }
  let handleNavigateToFaceID = (~flow) => {
    switch flow {
    | `FinternetOnboarding` => setCurrentFinternetOnboardingScreen(_ => FaceID)
    | `Onboarding` => setCurrentOnboardingScreen(_ => FaceID)
    | `Transfer` => {
        setShowAuthInitiated(_ => true)
        setCurrentTransferScreen(_ => FaceID)
      }
    }
    simpleWebAuthn()
    ->Promise.then(_ => {
      switch flow {
      | `FinternetOnboarding` => setCurrentFinternetOnboardingScreen(_ => QRScreen)
      | `Onboarding` => setCurrentOnboardingScreen(_ => QRScreen)
      | `Transfer` => {
          handleNavigateToTransactionCompleted()
          setCurrentTransferScreen(_ => TransactionCompleted)
        }
      }
      Js.Promise.resolve()
    })
    ->ignore
  }

  let renderTransferContent = () => {
    switch currentTransferScreen {
    | Login => <Login handleNavigate={_ => handleNavigateToHome()} />
    | Home => <Home handleNavigate={_ => setCurrentTransferScreen(_ => Transfer)} />
    | Transfer => <Transfer handleNavigate={_ => setCurrentTransferScreen(_ => EnterAmount)} />
    // | EnterAmount => <EnterAmount handleNavigate={_ => handleNavigateToEnterPin()} />
    | EnterAmount => <EnterAmount handleNavigate={_ => handleNavigateToFaceID(~flow="Transfer")} />

    | FaceID => <FaceID />
    | EnterPin => <EnterPin handleNavigate={_ => handleNavigateToTransactionCompleted()} />
    | TransactionCompleted =>
      <TransactionCompleted handleNavigate={_ => setCurrentTransferScreen(_ => Home)} />
    }
  }

  let renderOnboardingContent = () => {
    switch currentOnboardingScreen {
    | OnboardingLogin => <OnboardingLogin handleNavigate={_ => handleNavigateToVerfiyIdentity()} />
    | CreateAccount =>
      <CreateAccount handleNavigate={_ => handleNavigateToFaceID(~flow="Onboarding")} />
    | FaceID => <FaceID />
    | QRScreen =>
      <QRScreen handleNavigate={_ => setCurrentOnboardingScreen(_ => LinkBankAccount)} />
    | LinkBankAccount =>
      <LinkBankAccount handleNavigate={_ => setCurrentOnboardingScreen(_ => BankAccountLinked)} />
    | BankAccountLinked => <BankAccountLinked />
    }
  }

  let renderFinternetOnboardingContent = () => {
    switch currentFinternetOnboardingScreen {
    | OnboardingLogin =>
      <OnboardingLogin
        handleNavigate={_ => setCurrentFinternetOnboardingScreen(_ => CreateAccount)}
      />
    | CreateAccount =>
      // <CreateAccount handleNavigate={_ => handleNavigateToFaceID(~isFinternetOnboarding=true)} />
      <CreateAccount handleNavigate={_ => handleNavigateToFaceID(~flow="FinternetOnboarding")} />

    | FaceID => <FaceID />
    | QRScreen => <QRScreen />
    }
  }

  let renderLoanAgainstPropertyContent = () => {
    switch currentLoanAgainstPropertyScreen {
    | PropertyHome =>
      <PropertyHome handleNavigate={_ => setCurrentLoanAgainstPropertyScreen(_ => LinkProperty)} />
    | LinkProperty =>
      <LinkProperty handleNavigate={_ => setCurrentLoanAgainstPropertyScreen(_ => LinkedHome)} />
    | LinkedHome =>
      <LinkedHome handleNavigate={_ => setCurrentLoanAgainstPropertyScreen(_ => LoanSteps)} />
    | LoanSteps =>
      <LoanSteps
        handleNavigate={_ => setCurrentLoanAgainstPropertyScreen(_ => SelectBankForLoan)}
      />
    | SelectBankForLoan =>
      <SelectBankForLoan
        handleNavigate={_ => setCurrentLoanAgainstPropertyScreen(_ => FillLoanApplication)}
      />
    | FillLoanApplication =>
      <FillLoanApplication
        handleNavigate={_ => setCurrentLoanAgainstPropertyScreen(_ => LinkCredentials)}
      />
    | LinkCredentials =>
      <LinkCredentials
        handleNavigate={_ => setCurrentLoanAgainstPropertyScreen(_ => CheckEligibility)}
      />
    | CheckEligibility =>
      <CheckEligibility
        handleNavigate={_ => setCurrentLoanAgainstPropertyScreen(_ => LoanSanctionedSuccessfully)}
      />
    | LoanSanctionedSuccessfully =>
      <LoanSanctionedSuccessfully
        handleNavigate={_ => setCurrentLoanAgainstPropertyScreen(_ => LinkedHome)}
      />
    | _ => <div> {React.string("Unexpected Screen")} </div>
    }
  }

  let handleDrawerSelection = selectedOption => {
    switch selectedOption {
    | "User Onboarding" => setSelectedOption(_ => "User Onboarding")
    | "Domestic Money Transfer" => setSelectedOption(_ => "Domestic Money Transfer")
    | "Loan Against Property" => setSelectedOption(_ => "Loan Against Property")
    | "Finternet Onboarding" => setSelectedOption(_ => "Finternet Onboarding")

    | "Hello World!" => setSelectedOption(_ => "Hello World!")
    | _ => Js.log("Unexpected drawer selection: " ++ selectedOption)
    }
  }

  let renderContent = () => {
    switch selectedOption {
    | "User Onboarding" => renderOnboardingContent()
    | "Domestic Money Transfer" => renderTransferContent()
    | "Loan Against Property" => renderLoanAgainstPropertyContent()
    | "Finternet Onboarding" => renderFinternetOnboardingContent()

    | "Hello World" =>
      <div className="h-full w-full flex justify-center items-center text-2xl">
        {React.string("Welcome to the Home Page")}
      </div>
    | _ =>
      Js.log("Unhandled case in renderContent: " ++ selectedOption)
      React.null
    }
  }

  <div>
    <div
      //  className="absolute top-4 left-4 flex flex-row gap-1"
      className="flex justify-between items-center px-10 py-2 shadow ">
      // className="fixed top-0 left-0 w-full flex justify-between items-center px-10 py-2 shadow bg-white z-50">
      <div className="flex">
        <img src="/finternetLogo.png" alt="Description of image" className="h-10 w-10" />
        <div className="self-center"> {React.string("Playground")} </div>
      </div>
      // <GitHubIcon />
      <a href="https://github.com/finternet-io" target="_blank" rel="noopener noreferrer">
        <GitHubIcon />
      </a>
    </div>
    <div
      className="flex flex-col sm:flex-row  h-screen w-screen font-space-grotesk justify-between ">
      <div className="mr-10">
        <Drawer handleDrawerSelection={handleDrawerSelection} selectedOption={selectedOption} />
      </div>
      {selectedOption == "Hello World!"
        ? <div className="flex flex-col h-full w-full  items-center  my-40">
            <img src="/finternetLogo.png" alt="Description of image" className=" h-4/12 w-1/12" />
            <div className="w-5/12 text-center ">
              {React.string(
                "Welcome to the Finternet playground. Explore use cases that demonstrate how the Finternet unlocks transactability across assets. ",
              )}
            </div>
          </div>
        : <>
            <div
              className="flex flex-col sm:self-auto self-center min-h-[50rem] sm:min-h-full h-full w-4/5 sm:w-1/5  my-4 gap-4 ">
              // <div className="relative w-full flex justify-center items-center p-4">
              //   <div className="bg-white p-4 shadow-lg rounded-lg overflow-auto w-full max-w-[360px]">
              <div
                className="bg-white h-full sm:h-4/5 self-center w-full p-4 border  shadow-lg rounded-lg overflow-auto ">
                {renderContent()}
              </div>
              <div className="flex flex-row justify-around text-xl text-gray-400">
                <button
                  onClick={_ => {
                    switch selectedOption {
                    | "User Onboarding" => handlePrevOnboardingScreen()
                    | "Domestic Money Transfer" => handlePrevScreen()
                    | "Loan Against Property" => handlePrevLoanAgainstPropertyScreen()
                    | "Finternet Onboarding" => handlePrevFinternetOnboardingScreen()

                    | _ => Js.log("Unhandled case in renderContent: " ++ selectedOption)
                    }
                  }}>
                  {React.string("<")}
                </button>
                <button
                  onClick={_ => {
                    switch selectedOption {
                    | "User Onboarding" => handleNextOnboardingScreen()
                    | "Domestic Money Transfer" => handleNextScreen()
                    | "Loan Against Property" => handleNextLoanAgainstPropertyScreen()
                    | "Finternet Onboarding" => handleNextFinternetOnboardingScreen()

                    | _ => Js.log("Unhandled case in renderContent: " ++ selectedOption)
                    }
                  }}>
                  {React.string(">")}
                </button>
              </div>
            </div>
            // <div
            //   className="ml-4 p-4  bg-gray-100 rounded-lg w-3/5 h-full flex flex-col gap-3 overflow-auto ">
            {isCollapsed
              ? {
                  <div className="mr-5">
                    <button onClick={_ => setIsCollapsed(_ => false)}>
                      {React.string("<<<")}
                    </button>
                  </div>
                }
              : <div
                  className="sm:ml-4 p-4 bg-gray-100 rounded-lg w-4/5 min-h-96 sm:self-auto self-center sm:w-2/5 sm:h-5/6 flex flex-col gap-3 overflow-auto my-4 sm:mr-10">
                  <div className="flex flex-row w-full justify-end">
                    <button onClick={_ => setIsCollapsed(_ => true)}> {React.string("x")} </button>
                  </div>
                  <div className="text-2xl">
                    {switch selectedOption {
                    | "User Onboarding" => React.string("User Onboarding Activity Log (WIP)")
                    | "Domestic Money Transfer" => React.string("Domestic Transfer Activity Log")
                    | "Loan Against Property" => React.string("Loan Against Property Activity Log")
                    | "Finternet Onboarding" => React.string("Finternet Onboarding Activity Log")
                    | _ => React.string("Unexpected Screen")
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
                </div>}
            // :
            //  <div className="text-sm">
            // {React.string("Initiate transaction to view activity logs")}
            // </div>}
          </>}
      // <Drawer />
    </div>
    // <Drawer
    //   openDrawer={openDrawer}
    //   setOpenDrawer={setOpenDrawer}
    //   handleDrawerSelection={handleDrawerSelection}
    // />
  </div>
}
