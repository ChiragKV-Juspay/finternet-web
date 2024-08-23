open Colors
@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full  justify-between">
    <div className="flex flex-col gap-7 h-full">
      <HeaderWithBack title="Sign Agreement" backButtonStrokeColor=colors.propertyBlue />
      <div className="flex flex-col  gap-6 items-center h-full">
        <div> {React.string("Pledge Deed")} </div>
        <img src="/Agreement.svg" alt="Description of image" className=" scale-105 " />
      </div>
    </div>
    <div className="flex flex-col gap-4 ">
      <button
        className={` bg-[${colors.propertyBlue}] text-white rounded-lg w-full h-10`}
        onClick={_ => handleNavigate()}>
        {React.string("Sign using Wallet")}
      </button>
      <SecuredByFinterest color=colors.propertyBlue />
    </div>
  </div>
}
