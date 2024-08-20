@react.component
let make = (~onNavigateToBankAccountLinked) => {
  <div className="flex flex-col h-full justify-between">
    <div className="flex flex-col gap-10">
      <HeaderWithBack title="Bank" />
      <div className="">
        <div className="font-bold text-xl"> {React.string("Link Bank Account")} </div>
        <div className="font-light text-sm mt-4">
          {React.string("Follow the below steps to add your default bank accounts")}
        </div>
      </div>
      <img src="/SelectBankStepper.svg" alt="Description of image" />
    </div>
    <div className="flex flex-col gap-4">
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10"
        onClick={_ => onNavigateToBankAccountLinked()}>
        {React.string("Complete")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
