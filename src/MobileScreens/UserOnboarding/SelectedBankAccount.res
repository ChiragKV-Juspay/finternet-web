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

  <div className="flex flex-col h-full  justify-between">
    <div className="flex flex-col gap-7">
      <HeaderWithBack title="Select Account" />
      // <img src="/CheckEligibility1.svg" alt="Description of image" />
      <div>
        {ExampleData.bankAccountOptions
        ->Belt.Array.map(option => {
          let isSelected = selectedBank == option.id

          <div key={option.id} className="mt-6">
            <BankOption
              isSelected={isSelected}
              onClick={_ => handleBankOptionClick(option)}
              showCardNumber={true}
              showBankDetails={false}
              options={BankOptions(option)}
            />
            <div className="border-t border-dashed w-full mt-6 border-[#E6E6E6]" />
          </div>
        })
        ->React.array}
      </div>
    </div>
    <div className="flex flex-col gap-4">
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10" onClick={_ => handleNavigate()}>
        {React.string("Tokenize Account")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
