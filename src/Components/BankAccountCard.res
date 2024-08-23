@react.component
let make = (~handleNavigate) => {
  <div className="border border-gray-100  rounded-2xl ">
    <img src="/BankAccounts.svg" alt="Description of image" className=" h-auto p-5" />
    <div className="flex flex-row justify-between">
      <img src="/Balance.svg" alt="Description of image" className="p-5" />
      <button
        className="bg-[#00B76A] text-white rounded-lg m-5 h-10 w-32 "
        onClick={_ => handleNavigate()}>
        {React.string("Transfer")}
      </button>
    </div>
  </div>
}
