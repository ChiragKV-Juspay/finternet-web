@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full justify-between">
    <img
      src="/EnterAmountTop.svg"
      alt="Description of image"
      className="w-full h-auto max-w-xs md:max-w-md lg:max-w-lg"
    />
    <div className="flex flex-col gap-1">
      <div className="font-medium text-[#797979] text-sm"> {React.string("Amount")} </div>
      <div className="flex flex-row border border-[#E6E6E6] rounded-lg">
        <div className="flex flex-row  ml-2 gap-2 items-center ">
          <img src="/IndiaFlag.svg" alt="Description of image" />
          <div className="font-normal text-base"> {React.string("INR")} </div>
          <svg
            width="12" height="8" viewBox="0 0 12 8" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M5.58917 7.03844C5.37032 7.03882 5.15357 6.99595 4.95135 6.91229C4.74913 6.82862 4.56544 6.70582 4.41083 6.55094L0 2.13927L1.17833 0.960938L5.58917 5.37177L10 0.960938L11.1783 2.13927L6.7675 6.5501C6.61296 6.70514 6.4293 6.82809 6.22708 6.9119C6.02486 6.99571 5.80807 7.03871 5.58917 7.03844Z"
              fill="#00B76A"
            />
          </svg>
        </div>
        <Input placeholder="Enter amount" />
      </div>
    </div>
    <div>
      <div className="font-medium text-[#797979] text-sm"> {React.string("Select Purpose")} </div>
      <div
        className="flex flex-row gap-1 border border-[#E6E6E6] p-2 justify-between items-center rounded-lg">
        <div className="font-normal text-base"> {React.string("Tickets")} </div>
        <svg
          width="12" height="8" viewBox="0 0 12 8" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path
            d="M5.58917 7.03844C5.37032 7.03882 5.15357 6.99595 4.95135 6.91229C4.74913 6.82862 4.56544 6.70582 4.41083 6.55094L0 2.13927L1.17833 0.960938L5.58917 5.37177L10 0.960938L11.1783 2.13927L6.7675 6.5501C6.61296 6.70514 6.4293 6.82809 6.22708 6.9119C6.02486 6.99571 5.80807 7.03871 5.58917 7.03844Z"
            fill="#00B76A"
          />
        </svg>
      </div>
    </div>
    // <img
    //   src="/ExchangeRates.svg"
    //   alt="Description of image"
    //   className="w-full h-auto max-w-xs md:max-w-md lg:max-w-lg"
    // />
    <div className="flex flex-col gap-4">
      <button className=" bg-[#00B76A] text-white rounded-lg w-full h-10" onClick={handleNavigate}>
        {React.string("Proceed")}
      </button>
      <img src="/KeypadIphone.svg" alt="Description of image" />
    </div>
  </div>
}
