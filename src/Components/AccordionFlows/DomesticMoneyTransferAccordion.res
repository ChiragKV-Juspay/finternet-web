open Types
open Utils
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
  // Tokenize bodies
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

  // JSON representations
  let bodyJson = toJson(body)
  let accountTokenizeBodyJson = tokenizedBodyToJson(tokenizeAccountbody)
  let tokenizedPropertyBodyJson = tokenizedPropertyBodyToJson(tokenizePropertybody)

  let prettyJson = stringifyWithSpacing(userData, None, Some(2))
  let prettyAssets = stringifyWithSpacing(userAssets, None, Some(2))
  let prettyTransactionsHistory = stringifyWithSpacing(transactionsHistory, None, Some(2))
  let prettyTransactionResult = stringifyWithSpacing(transactionResult, None, Some(2))

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
                      //   {React.string(prettyPostBody)}
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
                      //   href={`https://explorer.solana.com/tx/${parsedTransactionResult.transaction_id}?cluster=devnet`}
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
  }

  <div> {accordionContent} </div>
}
