open Colors
@react.component
let make = (~showModal, ~toggleModal, ~text, ~buttonText) => {
  let modalStyle = "absolute -inset-4 flex items-end justify-center z-50 bg-black bg-opacity-50 "

  {
    showModal
      ? <div className={modalStyle} onClick={_ => toggleModal()}>
          <div
            className={`flex flex-col h-1/2 gap-6 w-full max-w-md bg-white justify-between items-center p-5 rounded-lg shadow-lg m-4`}>
            // className="flex flex-col h-1/2 gap-6 w-full max-w-md bg-white justify-between items-center p-5 rounded-lg shadow-lg ">
            <div className="flex flex-col gap-4 items-center">
              <div className="text-base text-center"> {React.string("Face ID")} </div>
              <div className="text-sm text-textGray text-center">
                {React.string("look at your camera for verifying your identity")}
              </div>
            </div>
            <img src="/FaceIDImage.svg" alt="Description of image" className="w-1/3 h-1/3" />
            <SecuredByFinterest color=colors.black />
          </div>
        </div>
      : React.null
  }
}
