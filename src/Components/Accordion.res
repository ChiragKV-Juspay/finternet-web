open Utils
open Types

type data = {transaction_id: string}
@scope("JSON") @val
external parseIntoMyData: string => data = "parse"

@react.component
let make = (
  ~userData,
  ~userAssets,
  ~transactionsHistory,
  ~showAuthInitiated,
  ~showTransactionConfirm,
  ~transactionResult,
  ~flowType,
  ~registerStartResponse,
  ~attestation,
  ~loginStartResponse,
  ~assertion,
  ~tokenizeAccount,
  ~tokenizeProperty,
  ~loginPropertyStartResponse,
  ~propertyLoginAssertion,
  ~agreementSigned,
) => {
  let tokenizeAccountbody: tokenizeBodyType = {
    token_manager: "ABC Bank",
    asset_type: "Money",
    currency: "INR",
    account_details: {
      account_number: "1234 1234 1234 1234",
    },
  }
  let tokenizePropertybody: tokenizePropertyBodyType = {
    asset_type: "Property",
    property_details: {
      property_id: "1234",
      property_registrar: "Some Registrar",
    },
    attestations: [{certificate: "NOC"}, {certificate: "Ownership"}, {certificate: "Value"}],
  }

  let signedTokenizePropertybody: tokenizePropertyBodyType = {
    asset_type: "Property",
    property_details: {
      property_id: "1234",
      property_registrar: "Some Registrar",
    },
    attestations: [
      {certificate: "MOC"},
      {certificate: "Ownership"},
      {certificate: "Value"},
      {certificate: "Personal Details"},
    ],
  }
  let body: record = {
    sender: "siddharth@finternet",
    recipient: "nandan@finternet",
    asset: {
      currency: "INR",
      unit: 2000,
      token_manager: "ABC Bank",
    },
    signature: "AWoqX7bTaHtIyGQzgs9_c8jYdhN7sC2ascAE9hsC",
  }

  let jwtBody: jwtBody = {
    token: "[TOKEN_PLACEHOLDER]",
    payload: {
      slMpcSetup: {keygen: Js.Json.object_(Js.Dict.empty())},
      timeout: 60,
      time: "2024-08-09T18:06:07.581Z",
    },
    uuid: "[USER_EMAIL_PLACEHOLDER]",
  }
  let keygenResponse0: keygenResponse = {
    public_key: "03823d089f3612a3d4a22223d15283475c20526475cbdca733f9228a11495b9694",
    total_send: 108435,
    total_recv: 108864,
    total_wait: 1752,
    total_time: 2505,
  }

  let keygenResponse1: keygenResponse = {
    public_key: "03823d089f3612a3d4a22223d15283475c20526475cbdca733f9228a11495b9694",
    total_send: 108371,
    total_recv: 108928,
    total_wait: 1135,
    total_time: 1906,
  }
  let keygenResponse2: keygenResponse = {
    public_key: "03823d089f3612a3d4a22223d15283475c20526475cbdca733f9228a11495b9694",
    total_send: 108403,
    total_recv: 108896,
    total_wait: 208,
    total_time: 921,
  }
  let bodyJson = toJson(body)
  let accountTokenizeBodyJson = tokenizedBodyToJson(tokenizeAccountbody)
  let tokenizedPropertyBodyJson = tokenizedPropertyBodyToJson(tokenizePropertybody)
  let jwtBodyJson = toJsonJwtBody(jwtBody)
  let keygenResponseJson0 = toJsonKeyGenResponse(keygenResponse0)
  let keygenResponseJson1 = toJsonKeyGenResponse(keygenResponse1)
  let keygenResponseJson2 = toJsonKeyGenResponse(keygenResponse2)

  let prettyJson = stringifyWithSpacing(userData, None, Some(2))
  let prettyTransactionsHistory = stringifyWithSpacing(transactionsHistory, None, Some(2))
  let prettyAssets = stringifyWithSpacing(userAssets, None, Some(2))

  let prettyTransactionResult = stringifyWithSpacing(transactionResult, None, Some(2))

  let parsedTransactionResult = parseIntoMyData(prettyTransactionResult)

  let prettyPostBody = stringifyWithSpacing(bodyJson, None, Some(2))
  let prettyRegisterStartResponse = stringifyWithSpacing(registerStartResponse, None, Some(2))
  let prettyLoginStartResponse = stringifyWithSpacing(loginStartResponse, None, Some(2))
  let prettyLoginPropertyStartResponse = stringifyWithSpacing(
    loginPropertyStartResponse,
    None,
    Some(2),
  )

  let prettyAttestation = stringifyWithSpacing(attestation, None, Some(2))
  let prettyAssertion = stringifyWithSpacing(assertion, None, Some(2))

  let prettyPropertyLoginAssertion = stringifyWithSpacing(propertyLoginAssertion, None, Some(2))

  let prettyJwtBody = stringifyWithSpacing(jwtBodyJson, None, Some(2))
  let prettyTokenizeAccountPostBody = stringifyWithSpacing(accountTokenizeBodyJson, None, Some(2))
  let tokenizedPropertyBodyJson = stringifyWithSpacing(tokenizedPropertyBodyJson, None, Some(2))
  let prettyKeyGenResponse0 = stringifyWithSpacing(keygenResponseJson0, None, Some(2))
  let prettyKeyGenResponse1 = stringifyWithSpacing(keygenResponseJson1, None, Some(2))
  let prettyKeyGenResponse2 = stringifyWithSpacing(keygenResponseJson2, None, Some(2))

  let accordionContent = switch flowType {
  | "Domestic Money Transfer" =>
    <div>
      {userData == Js.Json.null && userAssets == Js.Json.null && transactionsHistory == Js.Json.null
        ? <div className="text-sm text-gray-500">
            {React.string("Initiate transaction to view activity logs")}
          </div>
        : <div>
            <Mui.Accordion>
              <Mui.AccordionSummary
                expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
                {React.string("Fetch User Details")}
              </Mui.AccordionSummary>
              <Mui.AccordionDetails>
                {userData != Js.Json.null
                  ? <Mui.Accordion className="w-11/12 ">
                      <Mui.AccordionSummary
                        expandIcon={<ExpandMoreIcon />}
                        ariaControls="panel2-content"
                        id="panel2-header">
                        {React.string("GET user")}
                      </Mui.AccordionSummary>
                      <Mui.AccordionDetails className="text-sm overflow-auto">
                        <pre className="whitespace-pre-wrap"> {React.string(prettyJson)} </pre>
                      </Mui.AccordionDetails>
                    </Mui.Accordion>
                  : React.null}
                {userAssets != Js.Json.null
                  ? <Mui.Accordion className="w-11/12 ">
                      <Mui.AccordionSummary
                        expandIcon={<ExpandMoreIcon />}
                        ariaControls="panel2-content"
                        id="panel2-header">
                        {React.string("GET assets")}
                      </Mui.AccordionSummary>
                      <Mui.AccordionDetails className="text-sm overflow-auto">
                        <pre className="whitespace-pre-wrap"> {React.string(prettyAssets)} </pre>
                      </Mui.AccordionDetails>
                    </Mui.Accordion>
                  : React.null}
                {transactionsHistory != Js.Json.null
                  ? <Mui.Accordion className="w-11/12 ">
                      <Mui.AccordionSummary
                        expandIcon={<ExpandMoreIcon />}
                        ariaControls="panel2-content"
                        id="panel2-header">
                        {React.string("GET transactionsList")}
                      </Mui.AccordionSummary>
                      <Mui.AccordionDetails className="text-sm overflow-auto">
                        <pre className="whitespace-pre-wrap">
                          {React.string(prettyTransactionsHistory)}
                        </pre>
                      </Mui.AccordionDetails>
                    </Mui.Accordion>
                  : React.null}
              </Mui.AccordionDetails>
            </Mui.Accordion>
            {showAuthInitiated
              ? <AccordionItem
                  summary={React.string("Auth Initiated (Wallet)")}
                  summaryClassName=""
                  detailsContent={React.string("Transaction signed through the wallet")}
                  detailsClassName="text-sm overflow-auto"
                />
              : React.null}
            {showTransactionConfirm
              ? <AccordionItem
                  summary={React.string("Confirm Transaction")}
                  summaryClassName=""
                  detailsContent={<AccordionItem
                    summary={React.string(
                      "POST https://finternet-app-api.shuttleapp.rs/v1/users/ascWqX7bTaHtIyG/assets/123/asset:transfer",
                    )}
                    // summaryClassName="w-11/12"
                    detailsContent={<pre className="whitespace-pre-wrap">
                      {React.string(prettyPostBody)}
                    </pre>}
                    detailsClassName="text-sm overflow-auto"
                  />}
                />
              : React.null}
            {transactionResult != Js.Json.null
              ? <AccordionItem
                  summary={React.string("GET Transaction Details")}
                  detailsContent={<div className="text-sm overflow-auto">
                    <pre className="whitespace-pre-wrap">
                      {React.string(prettyTransactionResult)}
                    </pre>
                    <a
                      href={`https://explorer.solana.com/tx/${parsedTransactionResult.transaction_id}?cluster=devnet`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="flex items-center text-blue-500  hover:text-blue-700 transition duration-300">
                      {React.string("View in Solana")}
                    </a>
                  </div>}
                  detailsClassName="text-sm overflow-auto"
                />
              : React.null}
          </div>}
    </div>

  | "Finternet Onboarding" =>
    <div>
      {registerStartResponse == Js.Json.null && attestation == Js.Json.null
        ? <div className="text-sm text-gray-500">
            {React.string("Start onboarding to view activity logs")}
          </div>
        : <div>
            {registerStartResponse != Js.Json.null
              ? <AccordionItem
                  summary={React.string("User Register")}
                  detailsContent={<AccordionItem
                    summary={<div>
                      {React.string(
                        "POST https://selfnode.codecrane.com/auth-0/issue_passkeys_challenge",
                      )}
                      <br />
                      {React.string(
                        "POST https://selfnode.codecrane.com/auth-1/issue_passkeys_challenge",
                      )}
                      <br />
                      {React.string(
                        "POST https://selfnode.codecrane.com/auth-2/issue_passkeys_challenge",
                      )}
                    </div>}
                    // "POST https://selfnode.codecrane.com/auth-0/registerStart"

                    detailsContent={<pre className="whitespace-pre-wrap">
                      {React.string(prettyRegisterStartResponse)}
                    </pre>}
                    detailsClassName="text-sm overflow-auto"
                  />}
                />
              : React.null}
            {attestation != Js.Json.null
              ? <div>
                  <AccordionItem
                    summary={React.string("User Register Finish")}
                    detailsContent={<AccordionItem
                      summary={<div>
                        {React.string(
                          "POST https://selfnode.codecrane.com/auth-0/verify_passkeys_registration",
                        )}
                        <br />
                        {React.string(
                          "POST https://selfnode.codecrane.com/auth-1/verify_passkeys_registration",
                        )}
                        <br />
                        {React.string(
                          "POST https://selfnode.codecrane.com/auth-2/verify_passkeys_registration",
                        )}
                      </div>}
                      // "POST https://selfnode.codecrane.com/auth-0/registerFinish"

                      detailsContent={<pre className="whitespace-pre-wrap">
                        {React.string(prettyAttestation)}
                      </pre>}
                      detailsClassName="text-sm overflow-auto"
                    />}
                  />
                  <AccordionItem
                    summary={React.string("Generate Public Key")}
                    detailsContent={<div>
                      {React.string("Keygen response from party-0:")}
                      <pre className="whitespace-pre-wrap">
                        {React.string(prettyKeyGenResponse0)}
                      </pre>
                      <br />
                      {React.string("Keygen response from party-1:")}
                      <pre className="whitespace-pre-wrap">
                        {React.string(prettyKeyGenResponse1)}
                      </pre>
                      <br />
                      {React.string("Keygen response from party-2:")}
                      <pre className="whitespace-pre-wrap">
                        {React.string(prettyKeyGenResponse2)}
                      </pre>
                    </div>}
                    detailsClassName="text-sm overflow-auto"
                  />
                </div>
              : React.null}
          </div>}
    </div>
  | "User Onboarding" =>
    <div>
      {loginStartResponse == Js.Json.null && assertion == Js.Json.null
        ? <div className="text-sm text-gray-500">
            {React.string("Start onboarding to view activity logs")}
          </div>
        : <div>
            {loginStartResponse != Js.Json.null
              ? <AccordionItem
                  summary={React.string("User Login")}
                  detailsContent={<AccordionItem
                    summary={<div>
                      {React.string(
                        "POST https://selfnode.codecrane.com/auth-0/issue_authentication_challenge?user-id=mywallet",
                      )}
                      <br />
                      {React.string(
                        "POST https://selfnode.codecrane.com/auth-1/issue_authentication_challenge?user-id=mywallet",
                      )}
                      <br />
                      {React.string(
                        "POST https://selfnode.codecrane.com/auth-2/issue_authentication_challenge?user-id=mywallet",
                      )}
                    </div>}
                    // "POST https://selfnode.codecrane.com/auth-0/registerStart"

                    detailsContent={<pre className="whitespace-pre-wrap">
                      {React.string(prettyLoginStartResponse)}
                    </pre>}
                    detailsClassName="text-sm overflow-auto"
                  />}
                />
              : React.null}
            {assertion != Js.Json.null
              ? <div>
                  <AccordionItem
                    summary={React.string("User Login Finish")}
                    detailsContent={<AccordionItem
                      summary={<div>
                        // {React.string("POST https://selfnode.codecrane.com/auth-0/registerFinish")}
                        // <br />
                        // {React.string("POST https://selfnode.codecrane.com/auth-1/registerFinish")}
                        // <br />
                        {React.string("POST https://selfnode.codecrane.com/store-result")}
                      </div>}
                      // "POST https://selfnode.codecrane.com/auth-0/registerFinish"

                      detailsContent={<pre className="whitespace-pre-wrap">
                        {React.string(prettyAssertion)}
                      </pre>}
                      detailsClassName="text-sm overflow-auto"
                    />}
                  />
                  // <AccordionItem
                  //   summary={React.string("Verify JWT")}
                  //   detailsContent={<AccordionItem
                  //     summary={React.string(
                  //       "POST https://selfnode.codecrane.com/auth-0/verify_google_jwt",
                  //     )}
                  //     detailsContent={<pre className="whitespace-pre-wrap">
                  //       {React.string(prettyJwtBody)}
                  //     </pre>}
                  //     detailsClassName="text-sm overflow-auto"
                  //   />}
                  // />
                </div>
              : React.null}
            {tokenizeAccount
              ? <AccordionItem
                  summary={React.string("Tokenization")}
                  summaryClassName=""
                  detailsContent={<AccordionItem
                    summary={React.string(
                      "POST https://finternet-app-api.shuttleapp.rs/v1/users/ascWqX7bTaHtIyG/assets",
                    )}
                    // summaryClassName="w-11/12"
                    detailsContent={<pre className="whitespace-pre-wrap">
                      {React.string(prettyTokenizeAccountPostBody)}
                    </pre>}
                    detailsClassName="text-sm overflow-auto"
                  />}
                />
              : React.null}
          </div>}
    </div>
  | "Property User Onboarding" =>
    <div>
      {loginPropertyStartResponse == Js.Json.null && propertyLoginAssertion == Js.Json.null
        ? <div className="text-sm text-gray-500">
            {React.string("Start onboarding to view activity logs")}
          </div>
        : <div>
            {loginPropertyStartResponse != Js.Json.null
              ? <AccordionItem
                  summary={React.string("User Login")}
                  detailsContent={<AccordionItem
                    summary={<div>
                      {React.string(
                        "POST https://selfnode.codecrane.com/auth-0/issue_authentication_challenge?user-id=mywallet",
                      )}
                      <br />
                      {React.string(
                        "POST https://selfnode.codecrane.com/auth-1/issue_authentication_challenge?user-id=mywallet",
                      )}
                      <br />
                      {React.string(
                        "POST https://selfnode.codecrane.com/auth-2/issue_authentication_challenge?user-id=mywallet",
                      )}
                    </div>}
                    // "POST https://selfnode.codecrane.com/auth-0/registerStart"

                    detailsContent={<pre className="whitespace-pre-wrap">
                      {React.string(prettyLoginPropertyStartResponse)}
                    </pre>}
                    detailsClassName="text-sm overflow-auto"
                  />}
                />
              : React.null}
            {propertyLoginAssertion != Js.Json.null
              ? <div>
                  <AccordionItem
                    summary={React.string("User Login Finish")}
                    detailsContent={<AccordionItem
                      summary={<div>
                        // {React.string("POST https://selfnode.codecrane.com/auth-0/registerFinish")}
                        // <br />
                        // {React.string("POST https://selfnode.codecrane.com/auth-1/registerFinish")}
                        // <br />
                        {React.string("POST https://selfnode.codecrane.com/store-result")}
                      </div>}
                      // "POST https://selfnode.codecrane.com/auth-0/registerFinish"

                      detailsContent={<pre className="whitespace-pre-wrap">
                        {React.string(prettyPropertyLoginAssertion)}
                      </pre>}
                      detailsClassName="text-sm overflow-auto"
                    />}
                  />
                  // <AccordionItem
                  //   summary={React.string("Verify JWT")}
                  //   detailsContent={<AccordionItem
                  //     summary={React.string(
                  //       "POST https://selfnode.codecrane.com/auth-0/verify_google_jwt",
                  //     )}
                  //     detailsContent={<pre className="whitespace-pre-wrap">
                  //       {React.string(prettyJwtBody)}
                  //     </pre>}
                  //     detailsClassName="text-sm overflow-auto"
                  //   />}
                  // />
                </div>
              : React.null}
            {tokenizeProperty
              ? <AccordionItem
                  summary={React.string("Tokenization")}
                  summaryClassName=""
                  detailsContent={<AccordionItem
                    summary={React.string(
                      "POST https://finternet-app-api.shuttleapp.rs/v1/users/ascWqX7bTaHtIyG/assets",
                    )}
                    // summaryClassName="w-11/12"
                    detailsContent={<pre className="whitespace-pre-wrap">
                      {React.string(tokenizedPropertyBodyJson)}
                    </pre>}
                    detailsClassName="text-sm overflow-auto"
                  />}
                />
              : React.null}
          </div>}
    </div>
  | "Loan Against Property" =>
    <div>
      {userData == Js.Json.null && userAssets == Js.Json.null && transactionsHistory == Js.Json.null
        ? <div className="text-sm text-gray-500">
            {React.string("Start onboarding to view activity logs")}
          </div>
        : <div>
            <Mui.Accordion>
              <Mui.AccordionSummary
                expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
                {React.string("Fetch User Details")}
              </Mui.AccordionSummary>
              <Mui.AccordionDetails>
                {userData != Js.Json.null
                  ? <Mui.Accordion className="w-11/12 ">
                      <Mui.AccordionSummary
                        expandIcon={<ExpandMoreIcon />}
                        ariaControls="panel2-content"
                        id="panel2-header">
                        {React.string("GET user")}
                      </Mui.AccordionSummary>
                      <Mui.AccordionDetails className="text-sm overflow-auto">
                        <pre className="whitespace-pre-wrap"> {React.string(prettyJson)} </pre>
                      </Mui.AccordionDetails>
                    </Mui.Accordion>
                  : React.null}
                {userAssets != Js.Json.null
                  ? <Mui.Accordion className="w-11/12 ">
                      <Mui.AccordionSummary
                        expandIcon={<ExpandMoreIcon />}
                        ariaControls="panel2-content"
                        id="panel2-header">
                        {React.string("GET assets")}
                      </Mui.AccordionSummary>
                      <Mui.AccordionDetails className="text-sm overflow-auto">
                        <pre className="whitespace-pre-wrap"> {React.string(prettyAssets)} </pre>
                      </Mui.AccordionDetails>
                    </Mui.Accordion>
                  : React.null}
                {transactionsHistory != Js.Json.null
                  ? <Mui.Accordion className="w-11/12 ">
                      <Mui.AccordionSummary
                        expandIcon={<ExpandMoreIcon />}
                        ariaControls="panel2-content"
                        id="panel2-header">
                        {React.string("GET transactionsList")}
                      </Mui.AccordionSummary>
                      <Mui.AccordionDetails className="text-sm overflow-auto">
                        <pre className="whitespace-pre-wrap">
                          {React.string(prettyTransactionsHistory)}
                        </pre>
                      </Mui.AccordionDetails>
                    </Mui.Accordion>
                  : React.null}
              </Mui.AccordionDetails>
            </Mui.Accordion>
            {agreementSigned
              ? <AccordionItem
                  summary={React.string("Agreement Signature")}
                  summaryClassName=""
                  detailsContent={<AccordionItem
                    summary={React.string(
                      "POST https://finternet-app-api.shuttleapp.rs/v1/users/ascWqX7bTaHtIyG/assets/prpWaAX7bTaIyG/asset:pledge",
                    )}
                    // summaryClassName="w-11/12"
                    detailsContent={<pre className="whitespace-pre-wrap">
                      {React.string(tokenizedPropertyBodyJson)}
                    </pre>}
                    detailsClassName="text-sm overflow-auto"
                  />}
                />
              : React.null}
          </div>}
    </div>
  | _ => React.null
  }

  <div> {accordionContent} </div>
}
