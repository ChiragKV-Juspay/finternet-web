open Colors

@react.component
let make = (~handleNavigate) => {
  <div className=" flex flex-col h-full justify-between">
    <div className="flex flex-col gap-5">
      <HeaderWithBack title="Home" backButtonStrokeColor=colors.propertyBlue />
      <div className="flex flex-col gap-2">
        <div className={`text-sm text-[${colors.gray2}]`}>
          {React.string("Your verified properties")}
        </div>
        <div
          className="relative overflow-hidden flex flex-col border border-white shadow-md rounded-xl p-5 gap-5">
          <img
            src="/BackgroundPurpleGradient.svg"
            alt="Background Image"
            className="absolute right-0 z-0 -m-5"
          />
          <img src="/PropertyCardBlueForButton.svg" alt="Description of image" className="z-10" />
          <div className={`text-xs font-light text-[${colors.gray}]`}>
            {React.string("State Property Registrar")}
          </div>
          <button
            className={`bg-[${colors.propertyBlue}] text-xs  text-white rounded-lg p-2 `}
            onClick={_ => handleNavigate()}>
            {React.string("Request Loan")}
          </button>
        </div>
      </div>
      <img src="/EMICalculator.svg" alt="Description of image" className="scale-105" />
    </div>
    <SecuredByFinterest color={colors.propertyBlue} />
  </div>
}
