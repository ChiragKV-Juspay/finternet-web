@react.component
let make = (~handleNavigate) => {
  <div className="border border-gray-100  rounded-2xl ">
    <img src="/BankAccounts.svg" alt="Description of image" className="h-auto p-5 w-full" />
    <div className="flex flex-row justify-between items-center mx-5 pb-5">
      // <img src="/Balance.svg" alt="Description of image" className="p-5" />
      <div>
        <div className="font-extralight text-textGray"> {React.string("Balance")} </div>
        <div className="font-bold  text-xl"> {React.string("₹ 5000")} </div>
      </div>
      <button
        className="bg-[#00B76A] text-white rounded-lg  h-10 w-28 " onClick={_ => handleNavigate()}>
        {React.string("Transfer")}
      </button>
    </div>
  </div>
}
