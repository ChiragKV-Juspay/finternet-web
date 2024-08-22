open Colors
@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full justify-between">
    <div className="flex flex-col gap-10">
      <Header isFinternet={true} />
      <div className="">
        <div className="font-bold text-xl"> {React.string("Create account on the Finternet")} </div>
        <div className="font-light text-sm mt-4"> {React.string("Follow the below steps")} </div>
      </div>
      <img src="/VerifyIdentityStepper.svg" alt="Description of image" />
    </div>
    <div className="flex flex-col gap-4">
      <button
        className={` bg-black text-white rounded-lg w-full h-10`} onClick={_ => handleNavigate()}>
        {React.string("Get Started")}
      </button>
      <SecuredByFinterest color=colors.black />
    </div>
  </div>
}
