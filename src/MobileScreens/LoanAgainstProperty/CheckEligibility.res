@react.component
let make = (~onNavigateToLinkCredentials) => {
  <div className="flex flex-col h-full  justify-between">
    <div className="flex flex-col gap-7">
      <div className="flex flex-row gap-2">
        <img src="/BackIcon.svg" alt="Description of image" />
        <div className="font-bold text-base"> {React.string("Link / Upload Credentials")} </div>
      </div>
      <img src="/CheckEligibility1.svg" alt="Description of image" />
    </div>
    <div className="flex flex-col gap-4">
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10"
        onClick={_ => onNavigateToLinkCredentials()}>
        {React.string("Check Eligibility")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
