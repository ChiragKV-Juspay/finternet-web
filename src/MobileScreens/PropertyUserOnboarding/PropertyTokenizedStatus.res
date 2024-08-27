open Colors
@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col justify-end  h-full gap-14">
    <SuccessStatusWithText text="You have successfully tokenized your Property" color=Blue />
    <img src="/PropertyCardBlue.svg" alt="Description of image" />
    <div className="flex flex-col gap-5">
      <button
        className={` bg-[${colors.propertyBlue}] text-white rounded-lg w-full h-10 text-sm`}
        onClick={_ => handleNavigate()}>
        {React.string("Go to Dashboard")}
      </button>
      <SecuredByFinterest color={colors.propertyBlue} />
    </div>
  </div>
}
