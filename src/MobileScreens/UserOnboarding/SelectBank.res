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
        <HeaderWithBack title="Select a Bank" />
      </div>
      <div className="flex flex-col w-full my-7 ">
        <Input
          placeholder="Search bank"
          className=" p-3 border border-[#E6E6E6]  rounded-lg text-sm placeholder-text-sm mb-4"
        />
        <div>
          {ExampleData.bankOptions
          ->Belt.Array.map(option => {
            let isSelected = selectedBank == option.id

            <div key={option.id} className="mt-6">
              <BankOption
                isSelected={isSelected}
                onClick={_ => handleBankOptionClick(option)}
                showBankDetails={false}
                // bankIcon={option.imagePath}
                bankDetails={option}
              />
              {isSelected
                ? <button
                    className="bg-[#00B76A] text-white rounded-lg w-full h-10 mt-4"
                    onClick={_ => handleNavigate()}>
                    {React.string("Continue")}
                  </button>
                : React.null}
              <div className="border-t border-dashed w-full mt-6 border-[#E6E6E6]" />
            </div>
          })
          ->React.array}
          // <img src="/UnselectedBanks.svg" alt="Description of image" />
        </div>
      </div>
    </div>
    <SecuredByFinterest />
  </div>
}
