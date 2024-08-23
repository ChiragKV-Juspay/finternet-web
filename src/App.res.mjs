// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Home from "./MobileScreens/DomesticMoneyTransfer/Home.res.mjs";
import * as Login from "./MobileScreens/Login.res.mjs";
import * as React from "react";
import * as Drawer from "./Components/Drawer.res.mjs";
import * as FaceID from "./MobileScreens/UserOnboarding/FaceID.res.mjs";
import * as QRScreen from "./MobileScreens/FinternetOnboarding/QRScreen.res.mjs";
import * as Transfer from "./MobileScreens/DomesticMoneyTransfer/Transfer.res.mjs";
import * as Accordion from "./Components/Accordion.res.mjs";
import * as GitHubIcon from "./Icons/GitHubIcon.res.mjs";
import * as SelectBank from "./MobileScreens/UserOnboarding/SelectBank.res.mjs";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as EnterAmount from "./MobileScreens/DomesticMoneyTransfer/EnterAmount.res.mjs";
import * as FaceIDModal from "./Components/FaceIDModal.res.mjs";
import * as KeyFactSheet from "./MobileScreens/LoanAgainstProperty/KeyFactSheet.res.mjs";
import * as CreateAccount from "./MobileScreens/FinternetOnboarding/CreateAccount.res.mjs";
import * as FinternetHome from "./MobileScreens/FinternetHome.res.mjs";
import * as SignAgreement from "./MobileScreens/LoanAgainstProperty/SignAgreement.res.mjs";
import * as LinkBankAccount from "./MobileScreens/UserOnboarding/LinkBankAccount.res.mjs";
import * as BankAccountLinked from "./MobileScreens/UserOnboarding/BankAccountLinked.res.mjs";
import * as PropertyDashboard from "./MobileScreens/PropertyUserOnboarding/PropertyDashboard.res.mjs";
import * as SelectBankForLoan from "./MobileScreens/LoanAgainstProperty/SelectBankForLoan.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as PropertyDetailsForm from "./MobileScreens/PropertyUserOnboarding/PropertyDetailsForm.res.mjs";
import * as SelectedBankAccount from "./MobileScreens/UserOnboarding/SelectedBankAccount.res.mjs";
import * as TransactionCompleted from "./MobileScreens/DomesticMoneyTransfer/TransactionCompleted.res.mjs";
import * as Browser from "@simplewebauthn/browser";
import * as PropertyTokenizedStatus from "./MobileScreens/PropertyUserOnboarding/PropertyTokenizedStatus.res.mjs";
import * as PropertyTokenizationHome from "./MobileScreens/PropertyUserOnboarding/PropertyTokenizationHome.res.mjs";
import * as LoanSanctionedSuccessfully from "./MobileScreens/LoanAgainstProperty/LoanSanctionedSuccessfully.res.mjs";
import * as ShareVerifiableCredentials from "./MobileScreens/PropertyUserOnboarding/ShareVerifiableCredentials.res.mjs";
import * as AttestVerifiableCredentials from "./MobileScreens/PropertyUserOnboarding/AttestVerifiableCredentials.res.mjs";

function App(props) {
  var match = React.useState(function () {
        return "FinternetLogin";
      });
  var setCurrentFinternetOnboardingScreen = match[1];
  var currentFinternetOnboardingScreen = match[0];
  var match$1 = React.useState(function () {
        return "OnboardingLogin";
      });
  var setCurrentOnboardingScreen = match$1[1];
  var currentOnboardingScreen = match$1[0];
  var match$2 = React.useState(function () {
        return "Home";
      });
  var setCurrentTransferScreen = match$2[1];
  var currentTransferScreen = match$2[0];
  var match$3 = React.useState(function () {
        return "PropertyDashboard";
      });
  var setCurrentLoanAgainstPropertyScreen = match$3[1];
  var currentLoanAgainstPropertyScreen = match$3[0];
  var match$4 = React.useState(function () {
        return "PropertyLogin";
      });
  var setCurrentPropertyUserOnboardingScreen = match$4[1];
  var currentPropertyUserOnboardingScreen = match$4[0];
  var match$5 = React.useState(function () {
        return "Finternet Onboarding";
      });
  var setSelectedOption = match$5[1];
  var selectedOption = match$5[0];
  var match$6 = React.useState(function () {
        return null;
      });
  var match$7 = React.useState(function () {
        return null;
      });
  var match$8 = React.useState(function () {
        return null;
      });
  var match$9 = React.useState(function () {
        return null;
      });
  var setTransactionResult = match$9[1];
  var match$10 = React.useState(function () {
        return false;
      });
  var match$11 = React.useState(function () {
        return false;
      });
  var setShowTrasactionConfirm = match$11[1];
  var match$12 = React.useState(function () {
        return null;
      });
  var setRegisterStartResponse = match$12[1];
  var match$13 = React.useState(function () {
        return null;
      });
  var setAttestation = match$13[1];
  var match$14 = React.useState(function () {
        return false;
      });
  var setShowFaceIDModal = match$14[1];
  var toggleFaceIDModal = function () {
    setShowFaceIDModal(function (prev) {
          return !prev;
        });
  };
  var match$15 = React.useState(function () {
        return false;
      });
  var setIsCollapsed = match$15[1];
  var handlePrevScreen = function () {
    switch (currentTransferScreen) {
      case "Home" :
          return ;
      case "EnterAmount" :
          return setCurrentTransferScreen(function (param) {
                      return "Transfer";
                    });
      case "FaceID" :
          return setCurrentTransferScreen(function (param) {
                      return "EnterAmount";
                    });
      case "Transfer" :
          return setCurrentTransferScreen(function (param) {
                      return "Home";
                    });
      case "TransactionCompleted" :
          return setCurrentTransferScreen(function (param) {
                      return "FaceID";
                    });
      case "FinternetHome" :
          return setCurrentTransferScreen(function (param) {
                      return "TransactionCompleted";
                    });
      
    }
  };
  var handleNextScreen = function () {
    switch (currentTransferScreen) {
      case "Home" :
          return setCurrentTransferScreen(function (param) {
                      return "Transfer";
                    });
      case "EnterAmount" :
          return setCurrentTransferScreen(function (param) {
                      return "FaceID";
                    });
      case "FaceID" :
          return setCurrentTransferScreen(function (param) {
                      return "TransactionCompleted";
                    });
      case "Transfer" :
          return setCurrentTransferScreen(function (param) {
                      return "EnterAmount";
                    });
      case "TransactionCompleted" :
          return setCurrentTransferScreen(function (param) {
                      return "FinternetHome";
                    });
      case "FinternetHome" :
          return ;
      
    }
  };
  var handlePrevOnboardingScreen = function () {
    switch (currentOnboardingScreen) {
      case "OnboardingLogin" :
          return ;
      case "LinkBankAccount" :
          return setCurrentOnboardingScreen(function (param) {
                      return "OnboardingLogin";
                    });
      case "SelectBank" :
          return setCurrentOnboardingScreen(function (param) {
                      return "LinkBankAccount";
                    });
      case "SelectedBankAccount" :
          return setCurrentOnboardingScreen(function (param) {
                      return "SelectBank";
                    });
      case "FaceID" :
          return setCurrentOnboardingScreen(function (param) {
                      return "SelectedBankAccount";
                    });
      case "BankAccountLinked" :
          return setCurrentOnboardingScreen(function (param) {
                      return "FaceID";
                    });
      
    }
  };
  var handleNextOnboardingScreen = function () {
    switch (currentOnboardingScreen) {
      case "OnboardingLogin" :
          return setCurrentOnboardingScreen(function (param) {
                      return "LinkBankAccount";
                    });
      case "LinkBankAccount" :
          return setCurrentOnboardingScreen(function (param) {
                      return "SelectBank";
                    });
      case "SelectBank" :
          return setCurrentOnboardingScreen(function (param) {
                      return "SelectedBankAccount";
                    });
      case "SelectedBankAccount" :
          return setCurrentOnboardingScreen(function (param) {
                      return "FaceID";
                    });
      case "FaceID" :
          return setCurrentOnboardingScreen(function (param) {
                      return "BankAccountLinked";
                    });
      case "BankAccountLinked" :
          return ;
      
    }
  };
  var handlePrevFinternetOnboardingScreen = function () {
    switch (currentFinternetOnboardingScreen) {
      case "FinternetLogin" :
          return ;
      case "CreateAccount" :
          return setCurrentFinternetOnboardingScreen(function (param) {
                      return "FinternetLogin";
                    });
      case "FaceID" :
          return setCurrentFinternetOnboardingScreen(function (param) {
                      return "CreateAccount";
                    });
      case "QRScreen" :
          return setCurrentFinternetOnboardingScreen(function (param) {
                      return "FaceID";
                    });
      
    }
  };
  var handleNextFinternetOnboardingScreen = function () {
    switch (currentFinternetOnboardingScreen) {
      case "FinternetLogin" :
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
      
    }
  };
  var handlePrevLoanAgainstPropertyScreen = function () {
    switch (currentLoanAgainstPropertyScreen) {
      case "PropertyDashboard" :
          return ;
      case "ShareVerifiableCredentials" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "PropertyDashboard";
                    });
      case "SelectBankForLoan" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "ShareVerifiableCredentials";
                    });
      case "KeyFactSheet" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "SelectBankForLoan";
                    });
      case "SignAgreement" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "KeyFactSheet";
                    });
      case "LoanSanctionedSuccessfully" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "SignAgreement";
                    });
      
    }
  };
  var handleNextLoanAgainstPropertyScreen = function () {
    switch (currentLoanAgainstPropertyScreen) {
      case "PropertyDashboard" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "ShareVerifiableCredentials";
                    });
      case "ShareVerifiableCredentials" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "SelectBankForLoan";
                    });
      case "SelectBankForLoan" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "KeyFactSheet";
                    });
      case "KeyFactSheet" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "SignAgreement";
                    });
      case "SignAgreement" :
          return setCurrentLoanAgainstPropertyScreen(function (param) {
                      return "LoanSanctionedSuccessfully";
                    });
      case "LoanSanctionedSuccessfully" :
          return ;
      
    }
  };
  var handlePropertyUserOnboardingNextScreen = function () {
    switch (currentPropertyUserOnboardingScreen) {
      case "PropertyLogin" :
          return setCurrentPropertyUserOnboardingScreen(function (param) {
                      return "PropertyTokenizationHome";
                    });
      case "PropertyTokenizationHome" :
          return setCurrentPropertyUserOnboardingScreen(function (param) {
                      return "PropertyDetailsForm";
                    });
      case "PropertyDetailsForm" :
          return setCurrentPropertyUserOnboardingScreen(function (param) {
                      return "AttestVerifiableCredentials";
                    });
      case "AttestVerifiableCredentials" :
          return setCurrentPropertyUserOnboardingScreen(function (param) {
                      return "PropertyTokenizedStatus";
                    });
      case "PropertyTokenizedStatus" :
          return ;
      
    }
  };
  var handlePropertyUserOnboardingPrevScreen = function () {
    switch (currentPropertyUserOnboardingScreen) {
      case "PropertyLogin" :
          return ;
      case "PropertyTokenizationHome" :
          return setCurrentPropertyUserOnboardingScreen(function (param) {
                      return "PropertyLogin";
                    });
      case "PropertyDetailsForm" :
          return setCurrentPropertyUserOnboardingScreen(function (param) {
                      return "PropertyTokenizationHome";
                    });
      case "AttestVerifiableCredentials" :
          return setCurrentPropertyUserOnboardingScreen(function (param) {
                      return "PropertyDetailsForm";
                    });
      case "PropertyTokenizedStatus" :
          return setCurrentPropertyUserOnboardingScreen(function (param) {
                      return "AttestVerifiableCredentials";
                    });
      
    }
  };
  var simpleWebAuthn = async function () {
    setShowFaceIDModal(function (prev) {
          return !prev;
        });
    var transferBody = {
      username: "siddharth"
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
    return setShowFaceIDModal(function (prev) {
                return !prev;
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
  var handleNavigateToTransactionCompleted = function () {
    setCurrentTransferScreen(function (param) {
          return "TransactionCompleted";
        });
    setShowTrasactionConfirm(function (param) {
          return true;
        });
    performTransfer();
  };
  var handleNavigateToFaceID = function () {
    simpleWebAuthn().then(function () {
          switch (selectedOption) {
            case "Domestic Money Transfer" :
                handleNavigateToTransactionCompleted();
                setCurrentTransferScreen(function (param) {
                      return "TransactionCompleted";
                    });
                break;
            case "Finternet Onboarding" :
                setCurrentFinternetOnboardingScreen(function (param) {
                      return "QRScreen";
                    });
                break;
            case "Property User Onboarding" :
                setCurrentPropertyUserOnboardingScreen(function (param) {
                      return "PropertyTokenizationHome";
                    });
                break;
            case "User Onboarding" :
                setCurrentOnboardingScreen(function (param) {
                      return "LinkBankAccount";
                    });
                break;
            default:
              throw {
                    RE_EXN_ID: "Match_failure",
                    _1: [
                      "App.res",
                      323,
                      6
                    ],
                    Error: new Error()
                  };
          }
          return Promise.resolve();
        });
  };
  var renderFinternetOnboardingContent = function () {
    switch (currentFinternetOnboardingScreen) {
      case "FinternetLogin" :
          return JsxRuntime.jsx(Login.make, {
                      handleNavigate: (function () {
                          setCurrentFinternetOnboardingScreen(function (param) {
                                return "CreateAccount";
                              });
                        }),
                      flow: "FinternetOnboarding"
                    });
      case "CreateAccount" :
          return JsxRuntime.jsx(CreateAccount.make, {
                      handleNavigate: (function () {
                          handleNavigateToFaceID();
                        })
                    });
      case "FaceID" :
          return JsxRuntime.jsx(FaceID.make, {});
      case "QRScreen" :
          return JsxRuntime.jsx(QRScreen.make, {});
      
    }
  };
  var renderTransferContent = function () {
    switch (currentTransferScreen) {
      case "Home" :
          return JsxRuntime.jsx(Home.make, {
                      handleNavigate: (function () {
                          setCurrentTransferScreen(function (param) {
                                return "Transfer";
                              });
                        })
                    });
      case "EnterAmount" :
          return JsxRuntime.jsx(EnterAmount.make, {
                      handleNavigate: (function (param) {
                          handleNavigateToFaceID();
                        })
                    });
      case "FaceID" :
          return JsxRuntime.jsx(FaceID.make, {});
      case "Transfer" :
          return JsxRuntime.jsx(Transfer.make, {
                      handleNavigate: (function (param) {
                          setCurrentTransferScreen(function (param) {
                                return "EnterAmount";
                              });
                        })
                    });
      case "TransactionCompleted" :
          return JsxRuntime.jsx(TransactionCompleted.make, {
                      handleNavigate: (function (param) {
                          setCurrentTransferScreen(function (param) {
                                return "FinternetHome";
                              });
                        })
                    });
      case "FinternetHome" :
          return JsxRuntime.jsx(FinternetHome.make, {
                      handleNavigate: (function () {
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
          return JsxRuntime.jsx(Login.make, {
                      handleNavigate: (function () {
                          handleNavigateToFaceID();
                        }),
                      flow: "MoneyTransferOnboarding"
                    });
      case "LinkBankAccount" :
          return JsxRuntime.jsx(LinkBankAccount.make, {
                      handleNavigate: (function () {
                          setCurrentOnboardingScreen(function (param) {
                                return "SelectBank";
                              });
                        })
                    });
      case "SelectBank" :
          return JsxRuntime.jsx(SelectBank.make, {
                      handleNavigate: (function () {
                          setCurrentOnboardingScreen(function (param) {
                                return "SelectedBankAccount";
                              });
                        })
                    });
      case "SelectedBankAccount" :
          return JsxRuntime.jsx(SelectedBankAccount.make, {
                      handleNavigate: (function () {
                          setCurrentOnboardingScreen(function (param) {
                                return "FaceID";
                              });
                        })
                    });
      case "FaceID" :
          return JsxRuntime.jsx(FaceID.make, {});
      case "BankAccountLinked" :
          return JsxRuntime.jsx(BankAccountLinked.make, {});
      
    }
  };
  var renderLoanAgainstPropertyContent = function () {
    switch (currentLoanAgainstPropertyScreen) {
      case "PropertyDashboard" :
          return JsxRuntime.jsx(PropertyDashboard.make, {
                      handleNavigate: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "ShareVerifiableCredentials";
                              });
                        })
                    });
      case "ShareVerifiableCredentials" :
          return JsxRuntime.jsx(ShareVerifiableCredentials.make, {
                      handleNavigate: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "SelectBankForLoan";
                              });
                        })
                    });
      case "SelectBankForLoan" :
          return JsxRuntime.jsx(SelectBankForLoan.make, {
                      handleNavigate: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "KeyFactSheet";
                              });
                        })
                    });
      case "KeyFactSheet" :
          return JsxRuntime.jsx(KeyFactSheet.make, {
                      handleNavigate: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "SignAgreement";
                              });
                        })
                    });
      case "SignAgreement" :
          return JsxRuntime.jsx(SignAgreement.make, {
                      handleNavigate: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "LoanSanctionedSuccessfully";
                              });
                        })
                    });
      case "LoanSanctionedSuccessfully" :
          return JsxRuntime.jsx(LoanSanctionedSuccessfully.make, {
                      handleNavigate: (function () {
                          setCurrentLoanAgainstPropertyScreen(function (param) {
                                return "PropertyDashboard";
                              });
                        })
                    });
      
    }
  };
  var renderPropertyUserOnboardingContent = function () {
    switch (currentPropertyUserOnboardingScreen) {
      case "PropertyLogin" :
          return JsxRuntime.jsx(Login.make, {
                      handleNavigate: (function () {
                          handleNavigateToFaceID();
                        }),
                      flow: "PropertyOnboarding"
                    });
      case "PropertyTokenizationHome" :
          return JsxRuntime.jsx(PropertyTokenizationHome.make, {
                      handleNavigate: (function () {
                          setCurrentPropertyUserOnboardingScreen(function (param) {
                                return "PropertyDetailsForm";
                              });
                        })
                    });
      case "PropertyDetailsForm" :
          return JsxRuntime.jsx(PropertyDetailsForm.make, {
                      handleNavigate: (function () {
                          setCurrentPropertyUserOnboardingScreen(function (param) {
                                return "AttestVerifiableCredentials";
                              });
                        })
                    });
      case "AttestVerifiableCredentials" :
          return JsxRuntime.jsx(AttestVerifiableCredentials.make, {
                      handleNavigate: (function () {
                          setCurrentPropertyUserOnboardingScreen(function (param) {
                                return "PropertyTokenizedStatus";
                              });
                        })
                    });
      case "PropertyTokenizedStatus" :
          return JsxRuntime.jsx(PropertyTokenizedStatus.make, {
                      handleNavigate: (function () {
                          
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
      case "Property User Onboarding" :
          return setSelectedOption(function (param) {
                      return "Property User Onboarding";
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
      case "Property User Onboarding" :
          return renderPropertyUserOnboardingContent();
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
    if (match$15[0]) {
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
        case "Property User Onboarding" :
            tmp$2 = "Property User Onboarding Activity Log";
            break;
        case "User Onboarding" :
            tmp$2 = "User Onboarding Activity Log (WIP)";
            break;
        default:
          tmp$2 = "Unexpected Screen";
      }
      tmp$1 = JsxRuntime.jsxs("div", {
            children: [
              JsxRuntime.jsx("button", {
                    children: "x",
                    className: "absolute top-3 right-3",
                    onClick: (function (param) {
                        setIsCollapsed(function (param) {
                              return true;
                            });
                      })
                  }),
              JsxRuntime.jsx("div", {
                    children: tmp$2,
                    className: "text-2xl"
                  }),
              JsxRuntime.jsx(Accordion.make, {
                    userData: match$6[0],
                    userAssets: match$8[0],
                    transactionsHistory: match$7[0],
                    showAuthInitiated: match$10[0],
                    showTransactionConfirm: match$11[0],
                    transactionResult: match$9[0],
                    flowType: selectedOption,
                    registerStartResponse: match$12[0],
                    attestation: match$13[0]
                  })
            ],
            className: "relative sm:ml-4 p-4 bg-gray-100 rounded-lg w-4/5 min-h-96 sm:self-auto self-center sm:w-2/5 sm:h-5/6 flex flex-col gap-3 overflow-auto my-4 sm:mr-10"
          });
    }
    tmp = JsxRuntime.jsxs(JsxRuntime.Fragment, {
          children: [
            JsxRuntime.jsxs("div", {
                  children: [
                    JsxRuntime.jsxs("div", {
                          children: [
                            renderContent(),
                            JsxRuntime.jsx(FaceIDModal.make, {
                                  showModal: match$14[0],
                                  toggleModal: toggleFaceIDModal,
                                  text: "Link your Finternet account with the the MyProp app",
                                  buttonText: "Link"
                                })
                          ],
                          className: "relative bg-white h-full sm:h-4/5 self-center w-full p-4 ring-4 ring-offset-4 ring-black shadow-lg rounded-lg overflow-auto"
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
                                        case "Property User Onboarding" :
                                            return handlePropertyUserOnboardingPrevScreen();
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
                                        case "Property User Onboarding" :
                                            return handlePropertyUserOnboardingNextScreen();
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
                  className: "flex flex-col sm:self-auto self-center min-h-[50rem] sm:min-h-full h-full w-4/5 sm:w-1/5  my-4 gap-4 "
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
