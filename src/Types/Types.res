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

type accountDetailsType = {account_number: string}
type tokenizeBodyType = {
  token_manager: string,
  asset_type: string,
  currency: string,
  account_details: accountDetailsType,
}

type attestationType = {certificate: string}

type propertyDetailsType = {
  property_id: string,
  property_registrar: string,
}

type tokenizePropertyBodyType = {
  asset_type: string,
  property_details: propertyDetailsType,
  attestations: array<attestationType>,
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
// type prettyTransactionResultType = {transaction_id: string}
