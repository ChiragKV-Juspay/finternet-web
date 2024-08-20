@react.component
let make = (~onNavigateToFaceID) => {
  <div className="flex flex-col h-full justify-between">
    <div className="flex flex-col gap-10">
      <Header />
      <div className="">
        <div className="font-bold text-xl"> {React.string("Create account on the Finternet")} </div>
        <div className="font-light text-sm mt-4"> {React.string("Follow the below steps")} </div>
      </div>
      <img src="/VerifyIdentityStepper.svg" alt="Description of image" />
    </div>
    <div className="flex flex-col gap-4">
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10"
        onClick={_ => onNavigateToFaceID()}>
        {React.string("Get Started")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
