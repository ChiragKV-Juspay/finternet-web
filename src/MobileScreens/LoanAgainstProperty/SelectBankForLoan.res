@react.component
let make = (~onNavigateToFillLoanApplication) => {
  <div className="flex flex-col h-full justify-between">
    <div>
      <div className="flex flex-col gap-10">
        <div className="flex flex-row gap-2">
          <img src="/BackIcon.svg" alt="Description of image" />
          <div className="font-bold text-base"> {React.string("Select a Bank")} </div>
        </div>
      </div>
      <div className="flex flex-col w-full my-7 ">
        <input
          placeholder="Search bank"
          className=" p-3 border border-[#E6E6E6]  rounded-lg text-sm placeholder-text-sm mb-4"
        />
        <div>
          <div>
            <img src="/ABCBankSelected.svg" alt="Description of image" />
            <button
              className=" bg-[#00B76A] text-white rounded-lg w-full h-10"
              onClick={_ => onNavigateToFillLoanApplication()}>
              {React.string("Continue")}
            </button>
          </div>
          <img src="/UnselectedBanks.svg" alt="Description of image" />
        </div>
      </div>
    </div>
    <SecuredByFinterest />
  </div>
}
