// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Colors from "../../Utilities/Colors.res.mjs";
import * as Header from "../../Components/Header.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as SecuredByFinterest from "../../Components/SecuredByFinterest.res.mjs";

function CreateAccount(props) {
  var handleNavigate = props.handleNavigate;
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx(Header.make, {
                              isFinternet: true
                            }),
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: "Create account on the Finternet",
                                      className: "font-bold text-xl"
                                    }),
                                JsxRuntime.jsx("div", {
                                      children: "Follow the below steps",
                                      className: "font-light text-sm mt-4"
                                    })
                              ],
                              className: ""
                            }),
                        JsxRuntime.jsx("img", {
                              alt: "Description of image",
                              src: "/VerifyIdentityStepper.svg"
                            })
                      ],
                      className: "flex flex-col gap-10"
                    }),
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx("button", {
                              children: "Get Started",
                              className: " bg-black text-white rounded-lg w-full h-10",
                              onClick: (function (param) {
                                  handleNavigate();
                                })
                            }),
                        JsxRuntime.jsx(SecuredByFinterest.make, {
                              color: Colors.colors.black
                            })
                      ],
                      className: "flex flex-col gap-4"
                    })
              ],
              className: "relative flex flex-col h-full justify-between"
            });
}

var make = CreateAccount;

export {
  make ,
}
/* Header Not a pure module */
