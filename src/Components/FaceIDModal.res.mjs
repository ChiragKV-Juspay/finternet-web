// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Colors from "../Utilities/Colors.res.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as SecuredByFinterest from "./SecuredByFinterest.res.mjs";

function FaceIDModal(props) {
  var toggleModal = props.toggleModal;
  if (props.showModal) {
    return JsxRuntime.jsx("div", {
                children: JsxRuntime.jsxs("div", {
                      children: [
                        JsxRuntime.jsxs("div", {
                              children: [
                                JsxRuntime.jsx("div", {
                                      children: "Face ID",
                                      className: "text-base text-center"
                                    }),
                                JsxRuntime.jsx("div", {
                                      children: "look at your camera for verifying your identity",
                                      className: "text-sm text-textGray text-center"
                                    })
                              ],
                              className: "flex flex-col gap-4 items-center"
                            }),
                        JsxRuntime.jsx("img", {
                              className: "w-1/3 h-1/3",
                              alt: "Description of image",
                              src: "/FaceIDImage.svg"
                            }),
                        JsxRuntime.jsx(SecuredByFinterest.make, {
                              color: Colors.colors.black
                            })
                      ],
                      className: "flex flex-col h-1/2 gap-6 w-full max-w-md bg-white justify-between items-center p-5 rounded-lg shadow-lg m-4"
                    }),
                className: "absolute -inset-4 flex items-end justify-center z-50 bg-black bg-opacity-50 ",
                onClick: (function (param) {
                    toggleModal();
                  })
              });
  } else {
    return null;
  }
}

var make = FaceIDModal;

export {
  make ,
}
/* react/jsx-runtime Not a pure module */
