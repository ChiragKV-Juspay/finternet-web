@react.component
let make = (~onNavigateToLinkBankAccount=?) => {
  <div className="flex flex-col h-full gap-7">
    <Header />
    <div className="font-bold text-lg"> {React.string("Identity verified successfully!")} </div>
    <div
      className="flex flex-col justify-between items-center w-full border border-gray-100 drop-shadow-md rounded-2xl py-3 gap-4 py-5">
      <div className="w-11/12">
        <div className=" font-light text-[#797979] text-xs">
          {React.string("Account Address")}
        </div>
        <div className="flex flex-row justify-between">
          <div className=" text-base ">
            {React.string("nandan@finternet
")}
          </div>
          <img src="/CopyIcon.svg" alt="Description of image" />
        </div>
      </div>
      <img src="/QRCode.svg" alt="Description of image" className="w-11/12 self-center" />
      <div className="font-light text-[#797979] text-base">
        {React.string("Welcome to the Finternet!")}
      </div>
      <button
        className=" bg-[#00B76A] text-white text-xs rounded-lg w-3/5 h-10"
        onClick={_ =>
          switch onNavigateToLinkBankAccount {
          | Some(callback) => callback()
          | None => Js.log("No navigation function provided")
          }}>
        {React.string("Link Bank Accounts")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
