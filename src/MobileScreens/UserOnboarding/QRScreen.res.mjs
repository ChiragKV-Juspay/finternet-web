// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Header from "../../Components/Header.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as SecuredByFinterest from "../../Components/SecuredByFinterest.res.mjs";

function QRScreen(props) {
  var handleNavigate = props.handleNavigate;
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsx(Header.make, {}),
                JsxRuntime.jsx("div", {
                      children: "Identity verified successfully!",
                      className: "font-bold text-lg"
                    }),
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: "Account Address",
                                      className: " font-light text-[#797979] text-xs"
                                    }),
                                JsxRuntime.jsxs("div", {
                                      children: [
                                        JsxRuntime.jsx("div", {
                                              children: "nandan@finternet\n",
                                              className: " text-base "
                                            }),
                                        JsxRuntime.jsx("img", {
                                              alt: "Description of image",
                                              src: "/CopyIcon.svg"
                                            })
                                      ],
                                      className: "flex flex-row justify-between"
                                    })
                              ],
                              className: "w-11/12"
                            }),
                        JsxRuntime.jsx("img", {
                              className: "w-11/12 self-center",
                              alt: "Description of image",
                              src: "/QRCode.svg"
                            }),
                        JsxRuntime.jsx("div", {
                              children: "Welcome to the Finternet!",
                              className: "font-light text-[#797979] text-base"
                            }),
                        JsxRuntime.jsx("button", {
                              children: "Link Bank Accounts",
                              className: " bg-[#00B76A] text-white text-xs rounded-lg w-3/5 h-10",
                              onClick: (function (param) {
                                  if (handleNavigate !== undefined) {
                                    return handleNavigate();
                                  } else {
                                    console.log("No navigation function provided");
                                    return ;
                                  }
                                })
                            }),
                        JsxRuntime.jsx(SecuredByFinterest.make, {})
                      ],
                      className: "flex flex-col justify-between items-center w-full border border-gray-100 drop-shadow-md rounded-2xl py-3 gap-4 py-5"
                    })
              ],
              className: "flex flex-col h-full gap-7"
            });
}

var make = QRScreen;

export {
  make ,
}
/* Header Not a pure module */
