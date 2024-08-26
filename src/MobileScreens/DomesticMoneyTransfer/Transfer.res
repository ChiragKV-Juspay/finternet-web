@react.component
let make = (~handleNavigate) => {
  let firstOptionId = switch ExampleData.bankOptions[0] {
  | Some(option) => option.id
  | None => ""
  }
  let (selectedOption, setSelectedOption) = React.useState(() => firstOptionId)
  let handleContactOptionClick = (bank: ExampleData.contactOptionsType) => {
    setSelectedOption(_ => bank.id)
  }
  <div className="flex flex-col h-full gap-4 ">
    <HeaderWithBack title="Transfer" />
    <div className="flex flex-col gap-1 my-3 ">
      <div className="font-bold text-lg"> {React.string("Who are you sending to?")} </div>
      <div className="flex justify-start">
        <SecuredByFinterest />
      </div>
    </div>
    // <div>
    //   <img src="/TransferHeader.svg" alt="Description of image" />
    //   <img src="/SendingToHeader.svg" alt="Description of image" />
    // </div>
    <Input
      placeholder="Enter mobile number/name/account"
      className=" p-2 text-base border border-[#E6E6E6]  rounded-lg text-sm"
    />
    <div>
      {ExampleData.contactOptions
      ->Belt.Array.map(option => {
        let isSelected = selectedOption == option.id

        <div key={option.id} className="mt-6">
          <BankOption
            isSelected={isSelected}
            onClick={_ => handleContactOptionClick(option)}
            showBankDetails={false}
            // bankIcon={option.imagePath}
            // contactOptions={option}

            options={ContactOptions(option)}
          />
          {isSelected
            ? <button
                className="bg-[#00B76A] text-white rounded-lg w-full h-10 mt-4"
                onClick={_ => handleNavigate()}>
                {React.string("Proceed")}
              </button>
            : React.null}
          <div className="border-t border-dashed w-full mt-6 border-[#E6E6E6]" />
        </div>
      })
      ->React.array}
    </div>
  </div>
}
