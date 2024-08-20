// Generated by ReScript, PLEASE EDIT WITH CARE

import * as HeaderWithBack from "../../Components/HeaderWithBack.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as SecuredByFinterest from "../../Components/SecuredByFinterest.res.mjs";

function LoanSteps(props) {
  var handleNavigate = props.handleNavigate;
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx(HeaderWithBack.make, {
                              title: "Get a Loan"
                            }),
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: "Apply for a loan",
                                      className: "font-bold text-xl"
                                    }),
                                JsxRuntime.jsx("div", {
                                      children: "Apply for a loan with your property as collateral in 4 easy steps",
                                      className: "font-light text-sm mt-4"
                                    })
                              ],
                              className: ""
                            }),
                        JsxRuntime.jsx("img", {
                              alt: "Description of image",
                              src: "/LoanStepper.svg"
                            })
                      ],
                      className: "flex flex-col gap-5"
                    }),
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx("button", {
                              children: "Confirm",
                              className: " bg-[#00B76A] text-white rounded-lg w-full h-10",
                              onClick: (function (param) {
                                  handleNavigate();
                                })
                            }),
                        JsxRuntime.jsx(SecuredByFinterest.make, {})
                      ],
                      className: "flex flex-col gap-4"
                    })
              ],
              className: "flex flex-col h-full justify-between"
            });
}

var make = LoanSteps;

export {
  make ,
}
/* HeaderWithBack Not a pure module */
