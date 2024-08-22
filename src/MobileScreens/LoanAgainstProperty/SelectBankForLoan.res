open Colors

@react.component
let make = (~handleNavigate) => {
  let firstBankId = switch ExampleData.bankOptions[0] {
  | Some(option) => option.id
  | None => ""
  }

  let (selectedBank, setSelectedBank) = React.useState(() => firstBankId)

  let handleBankOptionClick = (bank: ExampleData.bankOptionsType) => {
    setSelectedBank(_ => bank.id)
  }

  <div className="flex flex-col h-full justify-between">
    <div>
      <div className="flex flex-col gap-10">
        <HeaderWithBack title="Select an offer" backButtonStrokeColor=colors.propertyBlue />
      </div>
      <div className="flex flex-col w-full my-7 ">
        <div className="flex flex-row justify-between">
          <div className="flex flex-row gap-1 items-center">
            <div className={`text-[10px] text-[${colors.gray}] font-extralight `}>
              {React.string("Provenance")}
            </div>
            <img src="/SmallBlueCheck.svg" alt="Description of image" />
          </div>
          <div className="flex flex-row gap-1 items-center">
            <div className={`text-[10px] text-[${colors.gray}] font-extralight`}>
              {React.string("Valuation")}
            </div>
            <img src="/SmallBlueCheck.svg" alt="Description of image" />
          </div>
          <div className="flex flex-row gap-1 items-center">
            <div className={`text-[10px] text-[${colors.gray}] font-extralight`}>
              {React.string("Encumberance")}
            </div>
            <img src="/SmallBlueCheck.svg" alt="Description of image" />
          </div>
          <div className="flex flex-row gap-1 items-center">
            <div className={`text-[10px] text-[${colors.gray}] font-extralight`}>
              {React.string("Personal")}
            </div>
            <img src="/SmallBlueCheck.svg" alt="Description of image" />
          </div>
        </div>
        <div>
          {ExampleData.bankOptions
          ->Belt.Array.map(option => {
            let isSelected = selectedBank == option.id

            <div key={option.id} className="mt-6">
              <BankOption
                isSelected={isSelected}
                onClick={_ => handleBankOptionClick(option)}
                // bankIcon={option.imagePath}
                bankDetails={option}
              />
              {isSelected
                ? <button
                    className={`bg-[${colors.propertyBlue}] text-white rounded-lg w-full h-10 mt-4`}
                    onClick={_ => handleNavigate()}>
                    {React.string("View Key Fact Sheet")}
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
          "By clicking continue, I agree to share any additional verifiable credentials to the selected bank, as may be required.",
        )}
      </div>
    </div>
    <SecuredByFinterest color=colors.propertyBlue />
  </div>
}
