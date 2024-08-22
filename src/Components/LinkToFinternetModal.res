@react.component
let make = (~showModal, ~toggleModal, ~handleNavigate, ~text, ~buttonText) => {
  let modalStyle = "absolute -inset-4 flex items-center justify-center z-50 bg-black bg-opacity-50"

  {
    showModal
      ? <div className={modalStyle} onClick={_ => toggleModal()}>
          <div
            className="flex flex-col gap-6 w-11/12  max-w-md bg-white p-6 rounded-lg shadow-lg"
            // onClick={e => e.stopPropagation()}
            /* Prevents closing when clicking inside the modal */
          >
            <div className="text-sm text-center ">
              // {React.string("Link your Finternet account with the the MyProp app")}
              {React.string(text)}
            </div>
            <div className="flex flex-row justify-between  ">
              <button
                className={`bg-white border border-[#0091FF] text-[#0091FF] rounded-lg w-5/12 p-1 `}
                onClick={_ => handleNavigate()}>
                {React.string("Cancel")}
              </button>
              <button
                className={`bg-[#0091FF] border border-[#0091FF] text-white rounded-lg w-5/12  p-1 `}
                onClick={_ => handleNavigate()}>
                {React.string(buttonText)}
              </button>
            </div>
          </div>
        </div>
      : React.null
  }
}
