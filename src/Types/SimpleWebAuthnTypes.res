// // src/SimpleWebAuthn.re

@module("@simplewebauthn/browser")
external startRegistration: Js.Json.t => Js.Promise.t<Js.Json.t> = "startRegistration"

// // [@bs.module "@simplewebauthn/browser"] external startAuthentication: (Js.Json.t) => Js.Promise.t<Js.Json.t> = "startAuthentication";

// // [@bs.module "@simplewebauthn/browser"] external parseRegistrationResponse: (Js.Json.t) => Js.Json.t = "parseRegistrationResponse";

// // [@bs.module "@simplewebauthn/browser"] external parseAuthenticationResponse: (Js.Json.t) => Js.Json.t = "parseAuthenticationResponse";

// // Define types based on the library's functionality. Adjust as needed.
// type registrationOptions = {
//   // Define the properties based on the options object used in `startRegistration`
// };

// type registrationResponse = {
//   // Define the properties based on the response from `startRegistration`
// };

// type authenticationOptions = {
//   // Define the properties based on the options object used in `startAuthentication`
// };

// type authenticationResponse = {
//   // Define the properties based on the response from `startAuthentication`
// };
