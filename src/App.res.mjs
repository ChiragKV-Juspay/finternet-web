// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Home from "./MobileScreens/DomesticMoneyTransfer/Home.res.mjs";
import * as Login from "./MobileScreens/DomesticMoneyTransfer/Login.res.mjs";
import * as React from "react";
import * as Drawer from "./Components/Drawer.res.mjs";
import * as FaceID from "./MobileScreens/UserOnboarding/FaceID.res.mjs";
import * as EnterPin from "./MobileScreens/DomesticMoneyTransfer/EnterPin.res.mjs";
import * as QRScreen from "./MobileScreens/UserOnboarding/QRScreen.res.mjs";
import * as Transfer from "./MobileScreens/DomesticMoneyTransfer/Transfer.res.mjs";
import * as Accordion from "./Components/Accordion.res.mjs";
import * as LoanSteps from "./MobileScreens/LoanAgainstProperty/LoanSteps.res.mjs";
import * as GitHubIcon from "./Icons/GitHubIcon.res.mjs";
import * as LinkedHome from "./MobileScreens/LoanAgainstProperty/LinkedHome.res.mjs";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as EnterAmount from "./MobileScreens/DomesticMoneyTransfer/EnterAmount.res.mjs";
import * as LinkProperty from "./MobileScreens/LoanAgainstProperty/LinkProperty.res.mjs";
import * as PropertyHome from "./MobileScreens/LoanAgainstProperty/PropertyHome.res.mjs";
import * as CreateAccount from "./MobileScreens/UserOnboarding/CreateAccount.res.mjs";
import * as LinkBankAccount from "./MobileScreens/UserOnboarding/LinkBankAccount.res.mjs";
import * as LinkCredentials from "./MobileScreens/LoanAgainstProperty/LinkCredentials.res.mjs";
import * as OnboardingLogin from "./MobileScreens/UserOnboarding/OnboardingLogin.res.mjs";
import * as CheckEligibility from "./MobileScreens/LoanAgainstProperty/CheckEligibility.res.mjs";
import * as BankAccountLinked from "./MobileScreens/UserOnboarding/BankAccountLinked.res.mjs";
import * as SelectBankForLoan from "./MobileScreens/LoanAgainstProperty/SelectBankForLoan.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as FillLoanApplication from "./MobileScreens/LoanAgainstProperty/FillLoanApplication.res.mjs";
import * as TransactionCompleted from "./MobileScreens/DomesticMoneyTransfer/TransactionCompleted.res.mjs";
import * as Browser from "@simplewebauthn/browser";
import * as LoanSanctionedSuccessfully from "./MobileScreens/LoanAgainstProperty/LoanSanctionedSuccessfully.res.mjs";

function App(props) {
  var match = React.useState(function () {
        return "OnboardingLogin";
      });
  var setCurrentOnboardingScreen = match[1];
  var currentOnboardingScreen = match[0];
  var match$1 = React.useState(function () {
        return "Transfer";
      });
  var setCurrentTransferScreen = match$1[1];
  var currentTransferScreen = match$1[0];
  var match$2 = React.useState(function () {
        return "PropertyHome";
      });
  var setCurrentLoanAgainstPropertyScreen = match$2[1];
  var currentLoanAgainstPropertyScreen = match$2[0];
  var match$3 = React.useState(function () {
        return "OnboardingLogin";
      });
  var setCurrentFinternetOnboardingScreen = match$3[1];
  var currentFinternetOnboardingScreen = match$3[0];
  var match$4 = React.useState(function () {
        return "Domestic Money Transfer";
      });
  var setSelectedOption = match$4[1];
  var selectedOption = match$4[0];
  var match$5 = React.useState(function () {
        return null;
      });
  var setUserData = match$5[1];
  var match$6 = React.useState(function () {
        return null;
      });
  var setTransactionsHistory = match$6[1];
  var match$7 = React.useState(function () {
        return null;
      });
  var setUserAssets = match$7[1];
  var match$8 = React.useState(function () {
        return null;
      });
  var setTransactionResult = match$8[1];
  var match$9 = React.useState(function () {
        return false;
      });
  var setShowAuthInitiated = match$9[1];
  var match$10 = React.useState(function () {
        return false;
      });
  var setShowTrasactionConfirm = match$10[1];
  var match$11 = React.useState(function () {
        return null;
      });
  var setRegisterStartResponse = match$11[1];
  var match$12 = React.useState(function () {
        return null;
      });
  var setAttestation = match$12[1];
  var match$13 = React.useState(function () {
        return false;
      });
  var setIsCollapsed = match$13[1];
  var handlePrevScreen = function () {
    switch (currentTransferScreen) {
      case "Login" :
          return ;
      case "Home" :
          return setCurrentTransferScreen(function (param) {
                      return "Login";
                    });
      case "EnterAmount" :
          return setCurrentTransferScreen(function (param) {
                      return "Transfer";
                    });
      case "EnterPin" :
          return setCurrentTransferScreen(function (param) {
                      return "EnterAmount";
                    });
      case "Transfer" :
          return setCurrentTransferScreen(function (param) {
                      return "Home";
                    });
      case "TransactionCompleted" :
          return setCurrentTransferScreen(function (param) {
                      return "EnterPin";
                    });
      
    }
  };
  var handleNextScreen = function () {
    switch (currentTransferScreen) {
      case "Login" :
          return setCurrentTransferScreen(function (param) {
                      return "Home";
                    });
      case "Home" :
          return setCurrentTransferScreen(function (param) {
                      return "Transfer";
                    });
      case "EnterAmount" :
          return setCurrentTransferScreen(function (param) {
                      return "EnterPin";
                    });
      case "EnterPin" :
          return setCurrentTransferScreen(function (param) {
                      return "TransactionCompleted";
                    });
      case "Transfer" :
          return setCurrentTransferScreen(function (param) {
                      return "EnterAmount";
                    });
      case "TransactionCompleted" :
          return ;
      
    }
  };
  var handlePrevOnboardingScreen = function () {
    switch (currentOnboardingScreen) {
      case "OnboardingLogin" :
          return ;
      case "CreateAccount" :
          return setCurrentOnboardingScreen(function (param) {
                      return "OnboardingLogin";
                    });
      case "FaceID" :
          return setCurrentOnboardingScreen(function (param) {
                      return "CreateAccount";
                    });
      case "QRScreen" :
          return setCurrentOnboardingScreen(function (param) {
                      return "FaceID";
                    });
      case "LinkBankAccount" :
          return setCurrentOnboardingScreen(function (param) {
                      return "QRScreen";
                    });
      case "BankAccountLinked" :
          return setCurrentOnboardingScreen(function (param) {
                      return "LinkBankAccount";
                    });
      
    }
  };
  var handleNextOnboardingScreen = function () {
    switch (currentOnboardingScreen) {
      case "OnboardingLogin" :
          return setCurrentOnboardingScreen(function (param) {
                      return "CreateAccount";
                    });
      case "CreateAccount" :
          return setCurrentOnboardingScreen(function (param) {
                      return "FaceID";
                    });
      case "FaceID" :
          return setCurrentOnboardingScreen(function (param) {
                      return "QRScreen";
                    });
      case "QRScreen" :
          return setCurrentOnboardingScreen(function (param) {
                      return "LinkBankAccount";
                    });
      case "LinkBankAccount" :
          return setCurrentOnboardingScreen(function (param) {
                      return "BankAccountLinked";
                    });
      case "BankAccountLinked" :
          return ;
      
    }
  };
  var handlePrevFinternetOnboardingScreen = function () {
    switch (currentFinternetOnboardingScreen) {
      case "OnboardingLogin" :
          return ;
      case "CreateAccount" :
          return setCurrentFinternetOnboardingScreen(function (param) {
                      return "OnboardingLogin";
                    });
      case "FaceID" :
          return setCurrentFinternetOnboardingScreen(function (param) {
                      return "CreateAccount";
                    });
      case "QRScreen" :
          return setCurrentFinternetOnboardingScreen(function (param) {
                      return "FaceID";
                    });
      case "LinkBankAccount" :
      case "BankAccountLinked" :
          throw {
                RE_EXN_ID: "Match_failure",
                _1: [
                  "App.res",
                  106,
                  4
                ],
                Error: new Error()
              };
      
    }
  };
  var handleNextFinternetOnboardingScreen = function () {
    switch (currentFinternetOnboardingScreen) {
      case "OnboardingLogin" :
          return setCurrentFinternetOnboardingScreen(function (param) {
                      return "CreateAccount";
                    });
      case "CreateAccount" :
          return setCurrentFinternetOnboardingScreen(function (param) {
                      return "FaceID";
                    });
      case "FaceID" :
          return setCurrentFinternetOnboardingScreen(function (param) {
                      return "QRScreen";
                    });
      case "QRScreen" :
          return ;
      case "LinkBankAccount" :
      case "BankAccountLinked" :
          throw {
                RE_EXN_ID: "Match_failure",
                _1: [
                  "App.res",
                  115,
                  4
                ],
                Error: new Error()
              };
      
    }
  };
  var handlePrevLoanAgainstPropertyScreen = function () {
    switch (currentLoanAgainstPropertyScreen) {
      case "PropertyHome" :
          return ;
      case "LinkProperty" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "PropertyHome";
                    });
      case "LinkedHome" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LinkProperty";
                    });
      case "LoanSteps" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LinkedHome";
                    });
      case "SelectBankForLoan" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LoanSteps";
                    });
      case "FillLoanApplication" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "SelectBankForLoan";
                    });
      case "LinkCredentials" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "FillLoanApplication";
                    });
      case "CheckEligibility" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LinkCredentials";
                    });
      case "LoanSanctionedSuccessfully" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "CheckEligibility";
                    });
      
    }
  };
  var handleNextLoanAgainstPropertyScreen = function () {
    switch (currentLoanAgainstPropertyScreen) {
      case "PropertyHome" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LinkProperty";
                    });
      case "LinkProperty" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LinkedHome";
                    });
      case "LinkedHome" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LoanSteps";
                    });
      case "LoanSteps" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "SelectBankForLoan";
                    });
      case "SelectBankForLoan" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "FillLoanApplication";
                    });
      case "FillLoanApplication" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LinkCredentials";
                    });
      case "LinkCredentials" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "CheckEligibility";
                    });
      case "CheckEligibility" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LoanSanctionedSuccessfully";
                    });
      case "LoanSanctionedSuccessfully" :
          return ;
      
    }
  };
  var fetchData = async function () {
    var response = await fetch("https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId");
    var json = await response.json();
    console.log(json);
    return setUserData(function (param) {
                return json;
              });
  };
  var fetchUserAssets = async function () {
    var response = await fetch("https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets");
    var json = await response.json();
    console.log(json);
    return setUserAssets(function (param) {
                return json;
              });
  };
  var simpleWebAuthn = async function () {
    var transferBody = {
      username: "arnab.d"
    };
    var response = await fetch("https://webauthn-fin-production.up.railway.app/api/passkey/registerStart", {
          method: "POST",
          body: Caml_option.some(Belt_Option.getExn(JSON.stringify(transferBody))),
          headers: Caml_option.some(new Headers({
                    "Content-type": "application/json"
                  }))
        });
    var json = await response.json();
    setRegisterStartResponse(function (param) {
          return json;
        });
    var attestationResponse = await Browser.startRegistration(json);
    setAttestation(function (param) {
          return attestationResponse;
        });
    await fetch("https://webauthn-fin-production.up.railway.app/api/passkey/registerFinish", {
          method: "POST",
          body: Caml_option.some(Belt_Option.getExn(JSON.stringify(attestationResponse))),
          headers: Caml_option.some(new Headers({
                    "Content-type": "application/json"
                  }))
        });
  };
  var fetchUserTransactionsHistory = async function () {
    var response = await fetch("https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets/123/history");
    var json = await response.json();
    console.log(json);
    return setTransactionsHistory(function (param) {
                return json;
              });
  };
  var performTransfer = function () {
    var postTransfer = async function () {
      var transferBody = {
        sender: "arnab.d@unifiedledger1",
        recipient: "ales@ledger",
        asset: {
          currency: "USD",
          unit: 200,
          token_manager: "tokenManagerAddress"
        },
        signature: "signature"
      };
      var response = await fetch("https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets/123/asset:transfer", {
            method: "POST",
            body: Caml_option.some(Belt_Option.getExn(JSON.stringify(transferBody))),
            headers: Caml_option.some(new Headers({
                      "Content-type": "application/json"
                    }))
          });
      var json = await response.json();
      return setTransactionResult(function (param) {
                  return json;
                });
    };
    postTransfer();
  };
  var handleNavigateToHome = function () {
    setCurrentTransferScreen(function (param) {
          return "Home";
        });
    fetchData();
    fetchUserTransactionsHistory();
    fetchUserAssets();
  };
  var handleNavigateToTransactionCompleted = function () {
    setCurrentTransferScreen(function (param) {
          return "TransactionCompleted";
        });
    setShowTrasactionConfirm(function (param) {
          return true;
        });
    performTransfer();
  };
  var handleNavigateToEnterPin = function () {
    setCurrentTransferScreen(function (param) {
          return "EnterPin";
        });
    setShowAuthInitiated(function (param) {
          return true;
        });
  };
  var handleNavigateToFaceID = function (isFinternetOnboardingOpt) {
    var isFinternetOnboarding = isFinternetOnboardingOpt !== undefined ? isFinternetOnboardingOpt : false;
    if (isFinternetOnboarding) {
      setCurrentFinternetOnboardingScreen(function (param) {
            return "FaceID";
          });
    } else {
      setCurrentOnboardingScreen(function (param) {
            return "FaceID";
          });
    }
    simpleWebAuthn().then(function () {
          if (isFinternetOnboarding) {
            setCurrentFinternetOnboardingScreen(function (param) {
                  return "QRScreen";
                });
          } else {
            setCurrentOnboardingScreen(function (param) {
                  return "QRScreen";
                });
          }
          return Promise.resolve();
        });
  };
  var renderTransferContent = function () {
    switch (currentTransferScreen) {
      case "Login" :
          return JsxRuntime.jsx(Login.make, {
                      onNavigateToHome: (function () {
                          handleNavigateToHome();
                        })
                    });
      case "Home" :
          return JsxRuntime.jsx(Home.make, {
                      onNavigateToReceiversList: (function () {
                          setCurrentTransferScreen(function (param) {
                                return "Transfer";
                              });
                        })
                    });
      case "EnterAmount" :
          return JsxRuntime.jsx(EnterAmount.make, {
                      onNavigateToEnterPin: (function (param) {
                          handleNavigateToEnterPin();
                        })
                    });
      case "EnterPin" :
          return JsxRuntime.jsx(EnterPin.make, {
                      onNavigateToTransactionCompleted: (function (param) {
                          handleNavigateToTransactionCompleted();
                        })
                    });
      case "Transfer" :
          return JsxRuntime.jsx(Transfer.make, {
                      onNavigateToEnterAmount: (function (param) {
                          setCurrentTransferScreen(function (param) {
                                return "EnterAmount";
                              });
                        })
                    });
      case "TransactionCompleted" :
          return JsxRuntime.jsx(TransactionCompleted.make, {
                      onNavigateToHome: (function (param) {
                          setCurrentTransferScreen(function (param) {
                                return "Home";
                              });
                        })
                    });
      
    }
  };
  var renderOnboardingContent = function () {
    switch (currentOnboardingScreen) {
      case "OnboardingLogin" :
          return JsxRuntime.jsx(OnboardingLogin.make, {
                      onNavigateToVerifyIdentity: (function () {
                          setCurrentOnboardingScreen(function (param) {
                                return "CreateAccount";
                              });
                        })
                    });
      case "CreateAccount" :
          return JsxRuntime.jsx(CreateAccount.make, {
                      onNavigateToFaceID: (function () {
                          handleNavigateToFaceID(undefined);
                        })
                    });
      case "FaceID" :
          return JsxRuntime.jsx(FaceID.make, {});
      case "QRScreen" :
          return JsxRuntime.jsx(QRScreen.make, {
                      onNavigateToLinkBankAccount: (function () {
                          setCurrentOnboardingScreen(function (param) {
                                return "LinkBankAccount";
                              });
                        })
                    });
      case "LinkBankAccount" :
          return JsxRuntime.jsx(LinkBankAccount.make, {
                      onNavigateToBankAccountLinked: (function () {
                          setCurrentOnboardingScreen(function (param) {
                                return "BankAccountLinked";
                              });
                        })
                    });
      case "BankAccountLinked" :
          return JsxRuntime.jsx(BankAccountLinked.make, {});
      
    }
  };
  var renderFinternetOnboardingContent = function () {
    switch (currentFinternetOnboardingScreen) {
      case "OnboardingLogin" :
          return JsxRuntime.jsx(OnboardingLogin.make, {
                      onNavigateToVerifyIdentity: (function () {
                          setCurrentFinternetOnboardingScreen(function (param) {
                                return "CreateAccount";
                              });
                        })
                    });
      case "CreateAccount" :
          return JsxRuntime.jsx(CreateAccount.make, {
                      onNavigateToFaceID: (function () {
                          handleNavigateToFaceID(true);
                        })
                    });
      case "FaceID" :
          return JsxRuntime.jsx(FaceID.make, {});
      case "QRScreen" :
          return JsxRuntime.jsx(QRScreen.make, {});
      case "LinkBankAccount" :
      case "BankAccountLinked" :
          throw {
                RE_EXN_ID: "Match_failure",
                _1: [
                  "App.res",
                  306,
                  4
                ],
                Error: new Error()
              };
      
    }
  };
  var renderLoanAgainstPropertyContent = function () {
    switch (currentLoanAgainstPropertyScreen) {
      case "PropertyHome" :
          return JsxRuntime.jsx(PropertyHome.make, {
                      onNavigateToLinkProperty: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "LinkProperty";
                              });
                        })
                    });
      case "LinkProperty" :
          return JsxRuntime.jsx(LinkProperty.make, {
                      onNavigateToLinkedHome: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "LinkedHome";
                              });
                        })
                    });
      case "LinkedHome" :
          return JsxRuntime.jsx(LinkedHome.make, {
                      onNavigateToLoanSteps: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "LoanSteps";
                              });
                        })
                    });
      case "LoanSteps" :
          return JsxRuntime.jsx(LoanSteps.make, {
                      onNavigateToSelectBankForLoan: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "SelectBankForLoan";
                              });
                        })
                    });
      case "SelectBankForLoan" :
          return JsxRuntime.jsx(SelectBankForLoan.make, {
                      onNavigateToFillLoanApplication: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "FillLoanApplication";
                              });
                        })
                    });
      case "FillLoanApplication" :
          return JsxRuntime.jsx(FillLoanApplication.make, {
                      onNavigateToLinkCredentials: (function (param) {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "LinkCredentials";
                              });
                        })
                    });
      case "LinkCredentials" :
          return JsxRuntime.jsx(LinkCredentials.make, {
                      onNavigateToFillLoanApplication: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "CheckEligibility";
                              });
                        })
                    });
      case "CheckEligibility" :
          return JsxRuntime.jsx(CheckEligibility.make, {
                      onNavigateToLinkCredentials: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "LoanSanctionedSuccessfully";
                              });
                        })
                    });
      case "LoanSanctionedSuccessfully" :
          return JsxRuntime.jsx(LoanSanctionedSuccessfully.make, {
                      onNavigateToPropertyHome: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "LinkedHome";
                              });
                        })
                    });
      
    }
  };
  var handleDrawerSelection = function (selectedOption) {
    switch (selectedOption) {
      case "Domestic Money Transfer" :
          return setSelectedOption(function (param) {
                      return "Domestic Money Transfer";
                    });
      case "Finternet Onboarding" :
          return setSelectedOption(function (param) {
                      return "Finternet Onboarding";
                    });
      case "Hello World!" :
          return setSelectedOption(function (param) {
                      return "Hello World!";
                    });
      case "Loan Against Property" :
          return setSelectedOption(function (param) {
                      return "Loan Against Property";
                    });
      case "User Onboarding" :
          return setSelectedOption(function (param) {
                      return "User Onboarding";
                    });
      default:
        console.log("Unexpected drawer selection: " + selectedOption);
        return ;
    }
  };
  var renderContent = function () {
    switch (selectedOption) {
      case "Domestic Money Transfer" :
          return renderTransferContent();
      case "Finternet Onboarding" :
          return renderFinternetOnboardingContent();
      case "Hello World" :
          return JsxRuntime.jsx("div", {
                      children: "Welcome to the Home Page",
                      className: "h-full w-full flex justify-center items-center text-2xl"
                    });
      case "Loan Against Property" :
          return renderLoanAgainstPropertyContent();
      case "User Onboarding" :
          return renderOnboardingContent();
      default:
        console.log("Unhandled case in renderContent: " + selectedOption);
        return null;
    }
  };
  var tmp;
  if (selectedOption === "Hello World!") {
    tmp = JsxRuntime.jsxs("div", {
          children: [
            JsxRuntime.jsx("img", {
                  className: " h-4/12 w-1/12",
                  alt: "Description of image",
                  src: "/finternetLogo.png"
                }),
            JsxRuntime.jsx("div", {
                  children: "Welcome to the Finternet playground. Explore use cases that demonstrate how the Finternet unlocks transactability across assets. ",
                  className: "w-5/12 text-center "
                })
          ],
          className: "flex flex-col h-full w-full  items-center  my-40"
        });
  } else {
    var tmp$1;
    if (match$13[0]) {
      tmp$1 = JsxRuntime.jsx("div", {
            children: JsxRuntime.jsx("button", {
                  children: "<<<",
                  onClick: (function (param) {
                      setIsCollapsed(function (param) {
                            return false;
                          });
                    })
                }),
            className: "mr-5"
          });
    } else {
      var tmp$2;
      switch (selectedOption) {
        case "Domestic Money Transfer" :
            tmp$2 = "Domestic Transfer Activity Log";
            break;
        case "Finternet Onboarding" :
            tmp$2 = "Finternet Onboarding Activity Log";
            break;
        case "Loan Against Property" :
            tmp$2 = "Loan Against Property Activity Log";
            break;
        case "User Onboarding" :
            tmp$2 = "User Onboarding Activity Log (WIP)";
            break;
        default:
          tmp$2 = "Unexpected Screen";
      }
      tmp$1 = JsxRuntime.jsxs("div", {
            children: [
              JsxRuntime.jsx("div", {
                    children: JsxRuntime.jsx("button", {
                          children: "x",
                          onClick: (function (param) {
                              setIsCollapsed(function (param) {
                                    return true;
                                  });
                            })
                        }),
                    className: "flex flex-row w-full justify-end"
                  }),
              JsxRuntime.jsx("div", {
                    children: tmp$2,
                    className: "text-2xl"
                  }),
              JsxRuntime.jsx(Accordion.make, {
                    userData: match$5[0],
                    userAssets: match$7[0],
                    transactionsHistory: match$6[0],
                    showAuthInitiated: match$9[0],
                    showTransactionConfirm: match$10[0],
                    transactionResult: match$8[0],
                    flowType: selectedOption,
                    registerStartResponse: match$11[0],
                    attestation: match$12[0]
                  })
            ],
            className: "ml-4 p-4 bg-gray-100 rounded-lg w-4/5 md:w-2/5 md:h-5/6 flex flex-col gap-3 overflow-auto my-4 mr-10"
          });
    }
    tmp = JsxRuntime.jsxs(JsxRuntime.Fragment, {
          children: [
            JsxRuntime.jsxs("div", {
                  children: [
                    JsxRuntime.jsx("div", {
                          children: renderContent(),
                          className: "bg-white h-4/5 self-center w-full p-4 border  shadow-lg rounded-lg overflow-auto "
                        }),
                    JsxRuntime.jsxs("div", {
                          children: [
                            JsxRuntime.jsx("button", {
                                  children: "<",
                                  onClick: (function (param) {
                                      switch (selectedOption) {
                                        case "Domestic Money Transfer" :
                                            return handlePrevScreen();
                                        case "Finternet Onboarding" :
                                            return handlePrevFinternetOnboardingScreen();
                                        case "Loan Against Property" :
                                            return handlePrevLoanAgainstPropertyScreen();
                                        case "User Onboarding" :
                                            return handlePrevOnboardingScreen();
                                        default:
                                          console.log("Unhandled case in renderContent: " + selectedOption);
                                          return ;
                                      }
                                    })
                                }),
                            JsxRuntime.jsx("button", {
                                  children: ">",
                                  onClick: (function (param) {
                                      switch (selectedOption) {
                                        case "Domestic Money Transfer" :
                                            return handleNextScreen();
                                        case "Finternet Onboarding" :
                                            return handleNextFinternetOnboardingScreen();
                                        case "Loan Against Property" :
                                            return handleNextLoanAgainstPropertyScreen();
                                        case "User Onboarding" :
                                            return handleNextOnboardingScreen();
                                        default:
                                          console.log("Unhandled case in renderContent: " + selectedOption);
                                          return ;
                                      }
                                    })
                                })
                          ],
                          className: "flex flex-row justify-around text-xl text-gray-400"
                        })
                  ],
                  className: "flex flex-col h-full w-4/5 sm:w-1/5  my-4 gap-4 "
                }),
            tmp$1
          ]
        });
  }
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("img", {
                                      className: "h-10 w-10",
                                      alt: "Description of image",
                                      src: "/finternetLogo.png"
                                    }),
                                JsxRuntime.jsx("div", {
                                      children: "Playground",
                                      className: "self-center"
                                    })
                              ],
                              className: "flex"
                            }),
                        JsxRuntime.jsx("a", {
                              children: JsxRuntime.jsx(GitHubIcon.make, {}),
                              href: "https://github.com/finternet-io",
                              rel: "noopener noreferrer",
                              target: "_blank"
                            })
                      ],
                      className: "flex justify-between items-center px-10 py-2 shadow "
                    }),
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx("div", {
                              children: JsxRuntime.jsx(Drawer.make, {
                                    handleDrawerSelection: handleDrawerSelection,
                                    selectedOption: selectedOption
                                  }),
                              className: "mr-10"
                            }),
                        tmp
                      ],
                      className: "flex flex-col sm:flex-row  h-screen w-screen font-space-grotesk justify-between "
                    })
              ]
            });
}

var make = App;

export {
  make ,
}
/* Home Not a pure module */
