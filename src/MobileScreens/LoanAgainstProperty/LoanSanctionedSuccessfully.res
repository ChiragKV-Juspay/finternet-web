open Colors
@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col justify-between h-full gap-14">
    <div className="flex flex-col gap-5">
      <div className="flex flex-col gap-3">
        <div className="flex flex-row gap-2 items-center">
          <img src="/SuccessBlueSmall.svg" alt="Description of image" />
          <div className="font-bold text-base"> {React.string("Loan Sanctioned")} </div>
        </div>
        <Divider />
      </div>
      <div>
        <div className="flex flex-row justify-between items-center mx-5">
          <div className={`text-sm text-[${colors.gray2}] `}> {React.string("Your loans")} </div>
          <div className="bg-lightBlue-rgba p-1 px-2 rounded-2xl">
            <div className={`text-xs font-medium text-[${colors.propertyBlue}] `}>
              {React.string("Add More")}
            </div>
          </div>
        </div>
        <img src="/PledgedCard.svg" alt="Description of image" />
      </div>
    </div>
    <div className="flex flex-col gap-5">
      <button
        className={` bg-[${colors.propertyBlue}] text-white rounded-lg w-full h-10 text-sm`}
        onClick={_ => handleNavigate()}>
        {React.string("Go back to Dashboard")}
      </button>
      <SecuredByFinterest color=colors.propertyBlue />
    </div>
  </div>
}
