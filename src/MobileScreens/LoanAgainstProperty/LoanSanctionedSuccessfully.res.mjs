// Generated by ReScript, PLEASE EDIT WITH CARE

import * as JsxRuntime from "react/jsx-runtime";
import * as SecuredByFinterest from "../../Components/SecuredByFinterest.res.mjs";

function LoanSanctionedSuccessfully(props) {
  var onNavigateToPropertyHome = props.onNavigateToPropertyHome;
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsx("img", {
                      alt: "Description of image",
                      src: "/LoanSanctionedSuccessfully.svg"
                    }),
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx("button", {
                              children: "Go to Home",
                              className: " bg-[#00B76A] text-white rounded-lg w-full h-10 text-sm",
                              onClick: (function (param) {
                                  onNavigateToPropertyHome();
                                })
                            }),
                        JsxRuntime.jsx(SecuredByFinterest.make, {})
                      ],
                      className: "flex flex-col gap-5"
                    })
              ],
              className: "flex flex-col justify-end h-full gap-14"
            });
}

var make = LoanSanctionedSuccessfully;

export {
  make ,
}
/* react/jsx-runtime Not a pure module */