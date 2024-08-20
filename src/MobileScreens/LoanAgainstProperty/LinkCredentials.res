@react.component
let make = (~onNavigateToFillLoanApplication) => {
  <div className="flex flex-col h-full  justify-between">
    <div className="flex flex-col gap-7">
      <HeaderWithBack title="Link / Upload Credentials" />
      <img src="/LinkCredentials.svg" alt="Description of image" />
    </div>
    <div className="flex flex-col gap-4">
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10"
        onClick={_ => onNavigateToFillLoanApplication()}>
        {React.string("Next")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
