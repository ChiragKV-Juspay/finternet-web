// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Colors from "../../Utilities/Colors.res.mjs";
import * as HeaderWithBack from "../../Components/HeaderWithBack.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as SecuredByFinterest from "../../Components/SecuredByFinterest.res.mjs";

function SignAgreement(props) {
  var handleNavigate = props.handleNavigate;
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx(HeaderWithBack.make, {
                              title: "Sign Agreement",
                              backButtonStrokeColor: Colors.colors.propertyBlue
                            }),
                        JsxRuntime.jsx("div", {
                              children: JsxRuntime.jsx("img", {
                                    className: " scale-105 ",
                                    alt: "Description of image",
                                    src: "/Agreement3.svg"
                                  }),
                              className: "flex flex-col  gap-6 items-center h-full"
                            })
                      ],
                      className: "flex flex-col gap-7 h-full"
                    }),
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx("button", {
                              children: "Sign using Wallet",
                              className: " bg-[" + Colors.colors.propertyBlue + "] text-white rounded-lg w-full h-10",
                              onClick: (function (param) {
                                  handleNavigate();
                                })
                            }),
                        JsxRuntime.jsx(SecuredByFinterest.make, {
                              color: Colors.colors.propertyBlue
                            })
                      ],
                      className: "flex flex-col gap-4 "
                    })
              ],
              className: "flex flex-col h-full  justify-between"
            });
}

var make = SignAgreement;

export {
  make ,
}
/* HeaderWithBack Not a pure module */
