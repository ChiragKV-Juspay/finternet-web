@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col justify-between py-10 h-full ">
    <SuccessStatusWithText text="Bank account linked Successfully!" />
    // <img
    //   src="/BankAccountLinkedSuccessfully.svg"
    //   alt="Description of image"
    //   className="w-full h-auto max-w-xs md:max-w-md lg:max-w-lg"
    // />
    <div>
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10 text-sm"
        onClick={handleNavigate}>
        {React.string("Next")}
      </button>
    </div>
  </div>
}
