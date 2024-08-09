open Belt.Int

@val
external stringifyWithSpacing: (Js.Json.t, option<int>, option<int>) => string = "JSON.stringify"

type asset = {
  currency: string,
  unit: int,
  token_manager: string,
}

type record = {
  sender: string,
  recipient: string,
  asset: asset,
  signature: string,
}

let toJson = (record: record) => {
  let assetDict = Js.Dict.fromArray([
    ("currency", Js.Json.string(record.asset.currency)),
    ("unit", Js.Json.number(record.asset.unit->toFloat)),
    ("token_manager", Js.Json.string(record.asset.token_manager)),
  ])

  let dict = Js.Dict.fromArray([
    ("sender", Js.Json.string(record.sender)),
    ("recipient", Js.Json.string(record.recipient)),
    ("asset", Js.Json.object_(assetDict)),
    ("signature", Js.Json.string(record.signature)),
  ])

  Js.Json.object_(dict)
}
@react.component
let make = (
  ~userData,
  ~userAssets,
  ~transactionsHistory,
  ~showAuthInitiated,
  ~showTransactionConfirm,
  ~transactionResult,
) => {
  let body: record = {
    sender: "arnab.d@unifiedledger1",
    recipient: "ales@ledger",
    asset: {
      currency: "USD",
      unit: 200,
      token_manager: "tokenManagerAddress",
    },
    signature: "signature",
  }

  let bodyJson = toJson(body)
  let prettyJson = stringifyWithSpacing(userData, None, Some(2))
  let prettyTransactionsHistory = stringifyWithSpacing(transactionsHistory, None, Some(2))
  let prettyAssets = stringifyWithSpacing(userAssets, None, Some(2))
  let prettyTransactionResult = stringifyWithSpacing(transactionResult, None, Some(2))
  let prettyPostBody = stringifyWithSpacing(bodyJson, None, Some(2))

  // <div>
  //   {userData != Js.Json.null || userAssets != Js.Json.null || transactionsHistory != Js.Json.null
  //     ? <Mui.Accordion>
  //         <Mui.AccordionSummary
  //           expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
  //           {React.string("Fetch User Details")}
  //         </Mui.AccordionSummary>
  //         <Mui.AccordionDetails>
  //           <Mui.Accordion className="w-11/12 ">
  //             <Mui.AccordionSummary
  //               expandIcon={<ExpandMoreIcon />} ariaControls="panel2-content" id="panel2-header">
  //               {React.string("GET user")}
  //             </Mui.AccordionSummary>
  //             <Mui.AccordionDetails className="text-sm">
  //               <pre className="whitespace-pre-wrap"> {React.string(prettyJson)} </pre>
  //             </Mui.AccordionDetails>
  //           </Mui.Accordion>
  //           <Mui.Accordion className="w-11/12 ">
  //             <Mui.AccordionSummary
  //               expandIcon={<ExpandMoreIcon />} ariaControls="panel2-content" id="panel2-header">
  //               {React.string("GET assets")}
  //             </Mui.AccordionSummary>
  //             <Mui.AccordionDetails>
  //               <pre className="whitespace-pre-wrap"> {React.string(prettyAssets)} </pre>
  //             </Mui.AccordionDetails>
  //           </Mui.Accordion>
  //           <Mui.Accordion className="w-11/12 ">
  //             <Mui.AccordionSummary
  //               expandIcon={<ExpandMoreIcon />} ariaControls="panel2-content" id="panel2-header">
  //               {React.string("GET transactionsList")}
  //             </Mui.AccordionSummary>
  //             <Mui.AccordionDetails>
  //               <pre className="whitespace-pre-wrap">
  //                 {React.string(prettyTransactionsHistory)}
  //               </pre>
  //             </Mui.AccordionDetails>
  //           </Mui.Accordion>
  //         </Mui.AccordionDetails>
  //       </Mui.Accordion>
  //     : React.null}
  //   {showAuthInitiated
  //     ? <Mui.Accordion>
  //         <Mui.AccordionSummary
  //           expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
  //           {React.string("Auth Initiated (Wallet)")}
  //         </Mui.AccordionSummary>
  //         <Mui.AccordionDetails className="text-sm">
  //           {React.string("Transaction signed through the wallet")}
  //         </Mui.AccordionDetails>
  //       </Mui.Accordion>
  //     : React.null}
  //   {showTransactionConfirm
  //     ? <Mui.Accordion>
  //         <Mui.AccordionSummary
  //           expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
  //           {React.string("Confirm Transaction")}
  //         </Mui.AccordionSummary>
  //         <Mui.AccordionDetails>
  //           <Mui.Accordion className="w-11/12 ">
  //             <Mui.AccordionSummary
  //               expandIcon={<ExpandMoreIcon />} ariaControls="panel2-content" id="panel2-header">
  //               {React.string(
  //                 "POST https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets/123/asset:transfer",
  //               )}
  //             </Mui.AccordionSummary>
  //             <Mui.AccordionDetails className="text-sm">
  //               <pre className="whitespace-pre-wrap"> {React.string(prettyPostBody)} </pre>
  //             </Mui.AccordionDetails>
  //           </Mui.Accordion>
  //         </Mui.AccordionDetails>
  //       </Mui.Accordion>
  //     : React.null}
  //   {transactionResult != Js.Json.null
  //     ? <Mui.Accordion>
  //         <Mui.AccordionSummary
  //           expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
  //           {React.string("GET Transaction Details")}
  //         </Mui.AccordionSummary>
  //         <Mui.AccordionDetails className="text-sm">
  //           <pre className="whitespace-pre-wrap"> {React.string(prettyTransactionResult)} </pre>
  //         </Mui.AccordionDetails>
  //       </Mui.Accordion>
  //     : React.null}
  // </div>

  <div>
    <Mui.Accordion>
      <Mui.AccordionSummary
        expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
        {React.string("Fetch User Details")}
      </Mui.AccordionSummary>
      <Mui.AccordionDetails>
        {userData != Js.Json.null
          ? <Mui.Accordion className="w-11/12 ">
              <Mui.AccordionSummary
                expandIcon={<ExpandMoreIcon />} ariaControls="panel2-content" id="panel2-header">
                {React.string("GET user")}
              </Mui.AccordionSummary>
              <Mui.AccordionDetails className="text-sm">
                <pre className="whitespace-pre-wrap"> {React.string(prettyJson)} </pre>
              </Mui.AccordionDetails>
            </Mui.Accordion>
          : React.null}
        {userAssets != Js.Json.null
          ? <Mui.Accordion className="w-11/12 ">
              <Mui.AccordionSummary
                expandIcon={<ExpandMoreIcon />} ariaControls="panel2-content" id="panel2-header">
                {React.string("GET assets")}
              </Mui.AccordionSummary>
              <Mui.AccordionDetails>
                <pre className="whitespace-pre-wrap"> {React.string(prettyAssets)} </pre>
              </Mui.AccordionDetails>
            </Mui.Accordion>
          : React.null}
        {transactionsHistory != Js.Json.null
          ? <Mui.Accordion className="w-11/12 ">
              <Mui.AccordionSummary
                expandIcon={<ExpandMoreIcon />} ariaControls="panel2-content" id="panel2-header">
                {React.string("GET transactionsList")}
              </Mui.AccordionSummary>
              <Mui.AccordionDetails>
                <pre className="whitespace-pre-wrap">
                  {React.string(prettyTransactionsHistory)}
                </pre>
              </Mui.AccordionDetails>
            </Mui.Accordion>
          : React.null}
      </Mui.AccordionDetails>
    </Mui.Accordion>
    {showAuthInitiated
      ? <Mui.Accordion>
          <Mui.AccordionSummary
            expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
            {React.string("Auth Initiated (Wallet)")}
          </Mui.AccordionSummary>
          <Mui.AccordionDetails className="text-sm">
            {React.string("Transaction signed through the wallet")}
          </Mui.AccordionDetails>
        </Mui.Accordion>
      : React.null}
    {showTransactionConfirm
      ? <Mui.Accordion>
          <Mui.AccordionSummary
            expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
            {React.string("Confirm Transaction")}
          </Mui.AccordionSummary>
          <Mui.AccordionDetails>
            <Mui.Accordion className="w-11/12 ">
              <Mui.AccordionSummary
                expandIcon={<ExpandMoreIcon />} ariaControls="panel2-content" id="panel2-header">
                {React.string(
                  "POST https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets/123/asset:transfer",
                )}
              </Mui.AccordionSummary>
              <Mui.AccordionDetails className="text-sm">
                <pre className="whitespace-pre-wrap"> {React.string(prettyPostBody)} </pre>
              </Mui.AccordionDetails>
            </Mui.Accordion>
          </Mui.AccordionDetails>
        </Mui.Accordion>
      : React.null}
    {transactionResult != Js.Json.null
      ? <Mui.Accordion>
          <Mui.AccordionSummary
            expandIcon={<ExpandMoreIcon />} ariaControls="panel1-content" id="panel1-header">
            {React.string("GET Transaction Details")}
          </Mui.AccordionSummary>
          <Mui.AccordionDetails className="text-sm">
            <pre className="whitespace-pre-wrap"> {React.string(prettyTransactionResult)} </pre>
          </Mui.AccordionDetails>
        </Mui.Accordion>
      : React.null}
  </div>
}
