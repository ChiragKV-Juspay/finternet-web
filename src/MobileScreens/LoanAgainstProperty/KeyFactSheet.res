open Colors
@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full  justify-between">
    <div className="flex flex-col gap-7">
      <HeaderWithBack title="View Loan Offer" backButtonStrokeColor=colors.propertyBlue />
      // <img src="/KeyFactCard.svg" alt="Description of image" />
      <LoanOfferCard />
    </div>
    <div className="flex flex-col gap-4">
      <button
        className={` bg-[${colors.propertyBlue}] text-white rounded-lg w-full h-10`}
        onClick={_ => handleNavigate()}>
        {React.string("Select Offer")}
      </button>
      <SecuredByFinterest color=colors.propertyBlue />
    </div>
  </div>
}
