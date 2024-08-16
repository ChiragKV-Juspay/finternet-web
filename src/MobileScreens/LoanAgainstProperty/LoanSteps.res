@react.component
let make = (~onNavigateToSelectBankForLoan) => {
  <div className="flex flex-col h-full justify-between">
    <div className="flex flex-col gap-10">
      <div className="flex flex-row gap-2">
        <img src="/BackIcon.svg" alt="Description of image" />
        <div className="font-bold text-base"> {React.string("Get a Loan")} </div>
      </div>
      <div className="">
        <div className="font-bold text-xl"> {React.string("Apply for a loan")} </div>
        <div className="font-light text-sm mt-4">
          {React.string("Apply for a loan with your property as collateral in 4 easy steps")}
        </div>
      </div>
      <img src="/LoanStepper.svg" alt="Description of image" />
    </div>
    <div className="flex flex-col gap-4">
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10"
        onClick={_ => onNavigateToSelectBankForLoan()}>
        {React.string("Confirm")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
