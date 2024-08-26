@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col justify-between h-full  ">
    // <img
    //   src="/TransactionSuccessful.svg"
    //   alt="Description of image"
    //   className="w-full h-auto max-w-xs md:max-w-md lg:max-w-lg"
    // />
    // <div className=>
    <div className="flex flex-col justify-end h-1/2 items-center">
      <SuccessStatusWithText
        text="Transaction Successful" descriptionText="Your transfer of ₹2000 is completed"
      />
    </div>
    <div>
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10 text-sm"
        onClick={handleNavigate}>
        {React.string("View in Wallet")}
      </button>
      <div className="flex items-center justify-center text-sm text-[#00B76A] w-full my-4">
        {React.string("View Transaction History")}
      </div>
    </div>
    // </div>
  </div>
}
