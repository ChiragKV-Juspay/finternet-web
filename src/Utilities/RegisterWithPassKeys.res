open Fetch
@val external crypto: 'a = "crypto"
@new external textEncoder: 'a = "TextEncoder"
@new external btoa: 'a = "btoa"

@new external uint8Array: 'a = "Uint8Array"

// @val external urlSafeBase64Encode: 'a = "urlSafeBase64Encode"
@val external navigator: 'a = "navigator"

// type digestType = {getElementById: (~receiver: string) => unit}
// type subtleType<'a> = {digest: (~string:string,)}
// type cryptoType<'a> = {subtle: subtleType<'a>}
type keygen = {
  n: int,
  t: int,
}

type slMpcSetup = {keygen: keygen}

type setup = {
  sl_mpc_setup: slMpcSetup,
  timeout: int,
  challenges: array<string>,
  time: Js.Date.t,
}
type rpCOnfigType = {
  rpName: string,
  rpId: string,
}

let baseUrl = "https://sl-dkls23-passkeys.silencelaboratories.com"

let rpConfig: rpCOnfigType = {
  rpName: "http://localhost:3001",
  rpId: "localhost",
}

// Logging to confirm the script is loaded
Console.log("USEPASSKEYS LOADED")
let registerWithPasskeys = async (userId: string) => {
  Console.log(userId)
  let urlSafeBase64Encode = (~value) => {
    let data = textEncoder["encode"](value)
    data["buffer"]
  }

  let arrayBufferToBase64Url = arrayBuffer => {
    Console.log(arrayBuffer)

    // Convert ArrayBuffer to Uint8Array
    let bytes = uint8Array(arrayBuffer)
    Console.log(bytes)

    // Convert Uint8Array to binary string
    let binaryString = Belt.Array.reduce(bytes, "", (acc, byte) =>
      acc ++ Js.String.fromCharCode(byte)
    )
    Console.log(binaryString)

    let base64 = btoa(binaryString)
    Console.log(base64)
    // Convert Base64 to Base64 URL safe format
    base64
    ->Js.String.replace("+", "-")
    ->Js.String.replace("/", "_")
    ->Js.String.replace("=", "")
  }

  //   try {
  // Fetch challenges from nodes
  let challengePromises = Belt.Array.makeBy(3, i => {
    Console.log(i)

    let url = `${baseUrl}/auth-${string_of_int(i)}/issue_passkeys_challenge`
    let fetchChallenge = async () => {
      let response = await Fetch.get(url)

      if response->Fetch.Response.status == 200 {
        let json = await response->Fetch.Response.json

        // Console.log(json)
        // Js.Json.decodeString(json)->Belt.Option.getExn
        json
      } else {
        Js.Exn.raiseError(`Error fetching challenge from ${url}`)
      }
    }
    fetchChallenge()
    // ->Promise.then(_ => {
    //   Console.log("resolved")
    //   Promise.resolve()
    // })
    // ->ignore
  })

  Console.log("Fetching challenges from nodes...")

  //   let challenges1 = switch challengePromises[0] {
  //   | Some(x) => await x
  //   }
  let challenges1 = await Promise.all(challengePromises)
  // ->Promise.then(res => {
  //   Console.log2("-- ", res)
  //   Promise.resolve()
  // })
  // ->Promise.catch(err => {
  //   Console.log2("err", err)
  //   Promise.reject(err)
  // })
  // ->ignore
  let challenges = ["", "", ""]
  Console.log("Challenges:")
  Console.log(challenges1)

  //   let timeNow = Js.Date.make()
  //   let setup = Js.Dict.empty()
  //   Js.Dict.set(
  //     setup,
  //     "sl_mpc_setup",
  //     {
  //       "keygen": {"n": 3, "t": 2},
  //     },
  //   )
  //   Js.Dict.set(setup, "timeout", 60)
  //   Js.Dict.set(setup, "challenges", challenges)
  //   Js.Dict.set(setup, "time", timeNow)
  // Define the types

  // Initialize the setup object
  let timeNow = Js.Date.make()
  let setup: setup = {
    sl_mpc_setup: {
      keygen: {
        n: 3,
        t: 2,
      },
    },
    timeout: 60,
    challenges,
    time: timeNow,
  }

  // Create the final challenge by hashing the setup string
  let setupString = setup->Js.Json.stringifyAny->Belt.Option.getExn

  let challenge = await crypto["subtle"]["digest"]("SHA-256", textEncoder["encode"](setupString))

  //   let challenge = await crypto.subtle.digest("SHA-256", Webapi.TextEncoder.encode(setupString))

  Js.log("Challenge:")
  //   Js.log(challenge->Webapi.Crypto.arrayBufferToBase64Url)

  let options = {
    "publicKey": {
      "authenticatorSelection": {
        "residentKey": "preferred",
        "requireResidentKey": false,
        "userVerification": "required",
      },
      "challenge": challenge,
      "excludeCredentials": [],
      "pubKeyCredParams": [{"type": "public-key", "alg": -7}, {"type": "public-key", "alg": -257}],
      "rp": {"name": rpConfig.rpName, "id": rpConfig.rpId},
      "user": {
        "name": userId,
        "displayName": userId,
        "id": urlSafeBase64Encode(~value=userId),
      },
    },
  }

  Js.log("Options:")
  Js.log(options)

  let my_cred = await navigator["credentials"]["create"](options)
  Js.log("Credentials:")
  Js.log(my_cred)

  if my_cred === Js.Nullable.null {
    Js.Exn.raiseError("No credential returned")
  }

  let my_cred_json =
    [
      ("authenticatorAttachment", my_cred["authenticatorAttachment"]->JSON.Encode.string),
      ("id", my_cred["id"]->JSON.Encode.string),
      ("rawId", arrayBufferToBase64Url(my_cred["rawId"])->JSON.Encode.string),
      (
        "response",
        [
          (
            "attestationObject",
            arrayBufferToBase64Url(my_cred["response"]["attestationObject"])->JSON.Encode.string,
          ),
          (
            "clientDataJSON",
            arrayBufferToBase64Url(my_cred["response"]["clientDataJSON"])->JSON.Encode.string,
          ),
        ]
        ->Dict.fromArray
        ->JSON.Encode.object,
      ),
      ("type", my_cred["type"]->JSON.Encode.string),
    ]
    ->Dict.fromArray
    ->JSON.Encode.object
    ->Js.Json.stringifyAny
    ->Belt.Option.getExn

  Js.log("As JSON:")
  Js.log(Js.Json.parseExn(my_cred_json))

  // Ask each node to verify the registration
  let registrationPromises = Belt.Array.makeBy(3, i => {
    let url = `${baseUrl}/auth-${string_of_int(i)}/verify_passkeys_registration`
    let body =
      {
        "raw_credential": my_cred_json,
        "user": options["publicKey"]["user"],
        "setup_string": setupString,
        "setup": setup,
        "origin": rpConfig.rpName,
        "rp_id": rpConfig.rpId,
      }
      ->Js.Json.stringifyAny
      ->Belt.Option.getExn
      ->Body.string

    let fetchRegistration = async () => {
      let response = await fetch(
        url,
        {
          method: #POST,
          body,
          headers: Headers.fromObject({
            "Content-Type": "application/json",
          }),
        },
      )
      if response->Fetch.Response.status == 200 {
        Js.log("Registered ok!")
        response->Fetch.Response.json
      } else {
        Js.Exn.raiseError(`Error validating registration with ${url}`)
      }
    }
    fetchRegistration()
  })

  Js.log("Validating registration with nodes...")
  let registrationResponses = await Js.Promise.all(registrationPromises)
  Js.log("Registration responses:")
  Js.log(registrationResponses)

  let firstResponse = Belt.Array.getExn(registrationResponses, 0)
  for i in 1 to 2 {
    let response = Belt.Array.getExn(registrationResponses, i)
    // if response["challenge_hex"] !== firstResponse.challenge_hex {
    //   Js.Exn.raiseError("Mismatched responses from nodes!")
    // }
  }

  //   let tokenArray = Belt.Array.map(registrationResponses, response => response["token"])

  //   {"success": true, "token": tokenArray, "id": userId}

  //   }
  //   catch (error) {
  //     Js.log("Registration error:")
  //     Js.log(error)
  //     Js.Exn.raise(error)
  //   }
}
