// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Input from "../../Components/Input.res.mjs";
import * as HeaderWithBack from "../../Components/HeaderWithBack.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as SecuredByFinterest from "../../Components/SecuredByFinterest.res.mjs";

function FillLoanApplication(props) {
  return JsxRuntime.jsxs("div", {
              children: [
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx(HeaderWithBack.make, {
                              title: "Fill Loan Application"
                            }),
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: "Select a property",
                                      className: " text-[#797979] text-xs"
                                    }),
                                JsxRuntime.jsx("img", {
                                      alt: "Description of image",
                                      src: "/SelectPropertyDropdown.svg"
                                    })
                              ],
                              className: "flex flex-col gap-2"
                            }),
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: "Type of Loan",
                                      className: " text-[#797979] text-xs"
                                    }),
                                JsxRuntime.jsx("img", {
                                      alt: "Description of image",
                                      src: "/TypeOfLoanDropdown.svg"
                                    })
                              ],
                              className: "flex flex-col gap-2"
                            }),
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: "Required Loan Amount",
                                      className: " text-[#797979] text-xs"
                                    }),
                                JsxRuntime.jsxs("div", {
                                      children: [
                                        JsxRuntime.jsx("div", {
                                              children: JsxRuntime.jsx("div", {
                                                    children: "₹",
                                                    className: "font-normal text-base"
                                                  }),
                                              className: "flex flex-row  ml-4 items-center "
                                            }),
                                        JsxRuntime.jsx(Input.make, {
                                              placeholder: "Enter the amount"
                                            })
                                      ],
                                      className: "flex flex-row border border-[#E6E6E6] rounded-lg"
                                    })
                              ],
                              className: "flex flex-col gap-2"
                            }),
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: "Tenure",
                                      className: "text-[#797979] text-xs"
                                    }),
                                JsxRuntime.jsxs("div", {
                                      children: [
                                        JsxRuntime.jsx(Input.make, {
                                              placeholder: "Enter the tenure"
                                            }),
                                        JsxRuntime.jsx("div", {
                                              children: JsxRuntime.jsx("div", {
                                                    children: "years",
                                                    className: "font-normal text-base"
                                                  }),
                                              className: "flex flex-row  mr-4  items-center "
                                            })
                                      ],
                                      className: "flex flex-row border border-[#E6E6E6] rounded-lg"
                                    })
                              ],
                              className: "flex flex-col gap-2"
                            }),
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: "Disbursal Account",
                                      className: " text-[#797979] text-xs"
                                    }),
                                JsxRuntime.jsx("img", {
                                      alt: "Description of image",
                                      src: "/AwesomeBankSelectedDropdown.svg"
                                    })
                              ],
                              className: "flex flex-col gap-2"
                            })
                      ],
                      className: "flex flex-col gap-7"
                    }),
                JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsx("button", {
                              children: "Next",
                              className: " bg-[#00B76A] text-white rounded-lg w-full h-10",
                              onClick: props.handleNavigate
                            }),
                        JsxRuntime.jsx(SecuredByFinterest.make, {})
                      ],
                      className: "flex flex-col gap-4"
                    })
              ],
              className: "flex flex-col h-full justify-between"
            });
}

var make = FillLoanApplication;

export {
  make ,
}
/* Input Not a pure module */
