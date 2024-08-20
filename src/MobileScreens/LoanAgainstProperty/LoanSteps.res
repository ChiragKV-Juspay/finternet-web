@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full justify-between">
    <div className="flex flex-col gap-5">
      <HeaderWithBack title="Get a Loan" />
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
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10" onClick={_ => handleNavigate()}>
        {React.string("Confirm")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
