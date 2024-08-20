@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full justify-between ">
    <div className="flex flex-col h-full gap-6">
      <img
        src="/EnterPinTop.svg"
        alt="Description of image"
        className="w-full h-auto max-w-xs md:max-w-md lg:max-w-lg"
      />
      <img
        src="/Pin.svg"
        alt="Description of image"
        className="w-full h-auto max-w-xs md:max-w-md lg:max-w-lg"
      />
    </div>
    <div className="flex flex-col gap-4">
      <button className=" bg-[#E31837] text-white rounded-lg w-full h-10" onClick={handleNavigate}>
        {React.string("Confirm & Pay")}
      </button>
      <img
        src="/KeypadIphone.svg"
        alt="Description of image"
        className="w-full h-auto max-w-xs md:max-w-md lg:max-w-lg"
      />
    </div>
  </div>
}
