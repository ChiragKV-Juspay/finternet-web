@val external crypto: 'a = "crypto"

// @module("crypto") external subtle: Js.Json.t = "subtle"

// @scope("Crypto.subtle") @val
// external digest: (
//   string,
//   Webapi.TypedArray.Uint8Array.t,
// ) => Js.Promise.t<Webapi.TypedArray.ArrayBuffer.t> = "digest"

// @module("TextEncoder") external textEncoder: unit => Js.Json.t = "TextEncoder"

@module("crypto")
external digest: (
  Js.Json.t,
  string,
  Js.Typed_array.Uint8Array.t,
) => Js.Promise.t<Js.Typed_array.ArrayBuffer.t> = "digest"

@module("crypto")
external getRandomValues: Js.Typed_array.Uint8Array.t => Js.Typed_array.Uint8Array.t =
  "getRandomValues"
