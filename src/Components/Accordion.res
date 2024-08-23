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

type slMpcSetup = {keygen: Js.Json.t}

type payload = {
  slMpcSetup: slMpcSetup,
  timeout: int,
  time: string,
}

type jwtBody = {
  token: string,
  payload: payload,
  uuid: string,
}

type keygenResponse = {
  public_key: string,
  total_send: int,
  total_recv: int,
  total_wait: int,
  total_time: int,
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

let toJsonJwtBody = (jwtBody: jwtBody) => {
  let slMpcSetupDict = Js.Dict.fromArray([("keygen", Js.Json.object_(Js.Dict.empty()))])

  let payloadDict = Js.Dict.fromArray([
    ("slMpcSetup", Js.Json.object_(slMpcSetupDict)),
    ("timeout", Js.Json.number(jwtBody.payload.timeout->toFloat)),
    ("time", Js.Json.string(jwtBody.payload.time)),
  ])

  let dict = Js.Dict.fromArray([
    ("token", Js.Json.string(jwtBody.token)),
    ("payload", Js.Json.object_(payloadDict)),
    ("uuid", Js.Json.string(jwtBody.uuid)),
  ])

  Js.Json.object_(dict)
}

let toJsonKeyGenResponse = (stats: keygenResponse) => {
  let dict = Js.Dict.fromArray([
    ("public_key", Js.Json.string(stats.public_key)),
    ("total_send", Js.Json.number(stats.total_send->toFloat)),
    ("total_recv", Js.Json.number(stats.total_recv->toFloat)),
    ("total_wait", Js.Json.number(stats.total_wait->toFloat)),
    ("total_time", Js.Json.number(stats.total_time->toFloat)),
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
  ~flowType,
  ~registerStartResponse,
  ~attestation,
) => {
  let body: record = {
    sender: "nandan@finternet",
    recipient: "ales@ledger",
    asset: {
      currency: "USD",
      unit: 200,
      token_manager: "tokenManagerAddress",
    },
    signature: "signature",
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
  let jwtBodyJson = toJsonJwtBody(jwtBody)
  let keygenResponseJson0 = toJsonKeyGenResponse(keygenResponse0)
  let keygenResponseJson1 = toJsonKeyGenResponse(keygenResponse1)
  let keygenResponseJson2 = toJsonKeyGenResponse(keygenResponse2)

  let prettyJson = stringifyWithSpacing(userData, None, Some(2))
  let prettyTransactionsHistory = stringifyWithSpacing(transactionsHistory, None, Some(2))
  let prettyAssets = stringifyWithSpacing(userAssets, None, Some(2))
  let prettyTransactionResult = stringifyWithSpacing(transactionResult, None, Some(2))
  let prettyPostBody = stringifyWithSpacing(bodyJson, None, Some(2))
  let prettyRegisterStartResponse = stringifyWithSpacing(registerStartResponse, None, Some(2))
  let prettyAttestation = stringifyWithSpacing(attestation, None, Some(2))
  let prettyJwtBody = stringifyWithSpacing(jwtBodyJson, None, Some(2))
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
                      "POST https://finternet-app-api.shuttleapp.rs/v1/users/exampleUserId/assets/123/asset:transfer",
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
                  detailsContent={<pre className="whitespace-pre-wrap">
                    {React.string(prettyTransactionResult)}
                  </pre>}
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
                      {React.string("POST https://selfnode.codecrane.com/auth-0/registerStart")}
                      <br />
                      {React.string("POST https://selfnode.codecrane.com/auth-1/registerStart")}
                      <br />
                      {React.string("POST https://selfnode.codecrane.com/auth-2/registerStart")}
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
                        {React.string("POST https://selfnode.codecrane.com/auth-0/registerFinish")}
                        <br />
                        {React.string("POST https://selfnode.codecrane.com/auth-1/registerFinish")}
                        <br />
                        {React.string("POST https://selfnode.codecrane.com/auth-2/registerFinish")}
                      </div>}
                      // "POST https://selfnode.codecrane.com/auth-0/registerFinish"

                      detailsContent={<pre className="whitespace-pre-wrap">
                        {React.string(prettyAttestation)}
                      </pre>}
                      detailsClassName="text-sm overflow-auto"
                    />}
                  />
                  <AccordionItem
                    summary={React.string("Verify JWT")}
                    detailsContent={<AccordionItem
                      summary={React.string(
                        "POST https://selfnode.codecrane.com/auth-0/verify_google_jwt",
                      )}
                      detailsContent={<pre className="whitespace-pre-wrap">
                        {React.string(prettyJwtBody)}
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

  | _ => React.null
  }

  <div> {accordionContent} </div>
}
