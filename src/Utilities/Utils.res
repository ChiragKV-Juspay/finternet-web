open Types

open Belt.Int

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

let tokenizedBodyToJson = (record: tokenizeBodyType) => {
  let accountDetailsDict = Js.Dict.fromArray([
    ("account_number", Js.Json.string(record.account_details.account_number)),
  ])
  let dict = Js.Dict.fromArray([
    ("token_manager", Js.Json.string(record.token_manager)),
    ("asset_type", Js.Json.string(record.asset_type)),
    ("currency", Js.Json.string(record.currency)),
    ("account_details", Js.Json.object_(accountDetailsDict)),
  ])

  Js.Json.object_(dict)
}

let tokenizedPropertyBodyToJson = (record: tokenizePropertyBodyType) => {
  let propertyDetailsDict = Js.Dict.fromArray([
    ("property_id", Js.Json.string(record.property_details.property_id)),
    ("property_registrar", Js.Json.string(record.property_details.property_registrar)),
  ])

  let attestationsArray = Belt.Array.map(record.attestations, attestation =>
    Js.Dict.fromArray([("certificate", Js.Json.string(attestation.certificate))])->Js.Json.object_
  )

  let dict = Js.Dict.fromArray([
    ("asset_type", Js.Json.string(record.asset_type)),
    ("property_details", Js.Json.object_(propertyDetailsDict)),
    ("attestations", Js.Json.array(attestationsArray)),
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

@val
external stringifyWithSpacing: (Js.Json.t, option<int>, option<int>) => string = "JSON.stringify"
