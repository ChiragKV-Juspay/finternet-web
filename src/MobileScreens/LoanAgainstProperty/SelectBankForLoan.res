open Colors

@react.component
let make = (~handleNavigate) => {
  let firstBankId = switch ExampleData.bankOptions[0] {
  | Some(option) => option.id
  | None => ""
  }

  let (selectedBank, setSelectedBank) = React.useState(() => firstBankId)
  let (loadingStates, setLoadingStates) = React.useState(() =>
    ExampleData.bankOptions->Belt.Array.map(option => (option.id, true))
  )

  Console.log(loadingStates)
  let handleBankOptionClick = (bank: ExampleData.bankOptionsType) => {
    setSelectedBank(_ => bank.id)
  }

  React.useEffect1(() => {
    let ids = ExampleData.bankOptions->Belt.Array.map(option => option.id)
    let timeoutIds = ids->Array.map(id => {
      let timeoutId = Js.Global.setTimeout(
        () => {
          setLoadingStates(
            loadingStates =>
              loadingStates->Array.map(
                state =>
                  switch state {
                  | (stateId, _) if stateId == id => (stateId, false)
                  | _ => state
                  },
              ),
          )
        },
        500,
      ) // 0.5 seconds delay
      timeoutId
    })
    let cleanup = () => {
      timeoutIds->Array.forEach(timeoutId => Js.Global.clearTimeout(timeoutId))
    }

    Some(cleanup)
  }, [])

  <div className="flex flex-col h-full justify-between">
    <div>
      <div className="flex flex-col gap-10">
        <HeaderWithBack title="Select an offer" backButtonStrokeColor=colors.propertyBlue />
      </div>
      <div className="flex flex-col w-full ">
        // <div className="flex flex-row justify-between">
        //   <div className="flex flex-row gap-1 items-center">
        //     <div className={`text-[10px] text-[${colors.gray}] font-extralight `}>
        //       {React.string("Provenance")}
        //     </div>
        //     <img src="/SmallBlueCheck.svg" alt="Description of image" />
        //   </div>
        //   <div className="flex flex-row gap-1 items-center">
        //     <div className={`text-[10px] text-[${colors.gray}] font-extralight`}>
        //       {React.string("Valuation")}
        //     </div>
        //     <img src="/SmallBlueCheck.svg" alt="Description of image" />
        //   </div>
        //   <div className="flex flex-row gap-1 items-center">
        //     <div className={`text-[10px] text-[${colors.gray}] font-extralight`}>
        //       {React.string("Encumberance")}
        //     </div>
        //     <img src="/SmallBlueCheck.svg" alt="Description of image" />
        //   </div>
        //   <div className="flex flex-row gap-1 items-center">
        //     <div className={`text-[10px] text-[${colors.gray}] font-extralight`}>
        //       {React.string("Personal")}
        //     </div>
        //     <img src="/SmallBlueCheck.svg" alt="Description of image" />
        //   </div>
        // </div>
        <div>
          {ExampleData.bankOptions
          ->Belt.Array.map(option => {
            let isSelected = selectedBank == option.id
            // let isLoading = false
            // let isLoading = switch loadingStates->Array.find(state =>
            //   Belt["Array"]["get"](state, 0) == option.id
            // ) {
            // | Some((_, loading)) => loading
            // | None => false
            // }
            <div key={option.id} className="mt-6">
              //   {isLoading
              //     ? <div className="flex items-center justify-center">
              //         <div
              //           className="animate-spin rounded-full h-10 w-10 border-t-2 border-blue-500"
              //         />
              //       </div>
              //     : <BankOption
              //         isSelected={isSelected}
              //         onClick={_ => handleBankOptionClick(option)}
              //         // bankIcon={option.imagePath}
              //         options={BankOptions(option)}
              //         showBankDetails={true}
              //       />}
              <BankOption
                isSelected={isSelected}
                onClick={_ => handleBankOptionClick(option)}
                // bankIcon={option.imagePath}
                options={BankOptions(option)}
                showBankDetails={true}
              />
              {isSelected
                ? <button
                    className={`bg-[${colors.propertyBlue}] text-white rounded-lg w-full h-10 mt-4`}
                    onClick={_ => handleNavigate()}>
                    {React.string("View Loan Offer")}
                  </button>
                : React.null}
              <div className="border-t border-dashed w-full mt-6 border-[#E6E6E6]" />
            </div>
          })
          ->React.array}
        </div>
      </div>
    </div>
    <div
      className={`flex flex-row gap-2 w-11/12 bg-white p-2 rounded-xl drop-shadow-md self-center`}>
      <img src="/Info.svg" alt="Description of image" />
      <div className={`text-xs font-light text-[${colors.gray}]`}>
        {React.string(
          "By clicking continue, I agree to share any additional property documents to the selected bank, as may be required.",
        )}
      </div>
    </div>
    <SecuredByFinterest color=colors.propertyBlue />
  </div>
}
