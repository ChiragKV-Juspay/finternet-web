@react.component
let make = () => {
  <div
    className="flex flex-col gap-8 relative border border-gray-100 rounded-2xl p-5 overflow-hidden ">
    <img
      src="/BackgroundPurpleGradient.svg"
      alt="Background Image"
      className="absolute right-0 z-0 -m-5"
    />
    <div className="flex flex-row gap-3 ">
      <div className="flex flex-row gap-2">
        <img src="/RoundedPinkRectangle.svg" alt="Description of image" />
        <div className="w-px h-4 bg-[#E6E6E6] self-center" />
      </div>
      <div className="font-bold text-sm self-center"> {React.string("ABC Bank")} </div>
    </div>
    <div className="flex flex-col gap-3 ">
      <div className="flex flex-col ">
        <div className=" text-lg font-light text-textGray"> {React.string("Applicant Name")} </div>
        <div className="font-bold text-lg"> {React.string("Siddharth Shetty")} </div>
      </div>
      <div className="border-t border-dashed w-full  border-[#E6E6E6]" />
      <div className="flex flex-col gap-2">
        <div className="flex flex-col ">
          <div className="text-lg font-light text-textGray"> {React.string("Property Value")} </div>
          <div className="font-bold text-lg"> {React.string("₹ 1,00,00,000")} </div>
        </div>
        <div className="flex flex-row gap-4">
          <div className="flex flex-col ">
            <div className=" text-lg font-light text-textGray"> {React.string("Loan Amount")} </div>
            <div className="font-bold text-lg"> {React.string("₹ 80,00,000")} </div>
          </div>
          <div className="flex flex-col ">
            <div className=" text-lg font-light text-textGray"> {React.string("Interest")} </div>
            <div className="font-bold text-lg"> {React.string("10 %")} </div>
          </div>
        </div>
        <div className="flex flex-col ">
          <div className=" text-lg font-light text-textGray"> {React.string("Tenure")} </div>
          <div className="font-bold text-lg"> {React.string("20 years")} </div>
        </div>
        <div className="flex flex-col ">
          <div className=" text-lg font-light text-textGray">
            {React.string("Estimated Monthly EMI")}
          </div>
          <div className="font-bold text-lg"> {React.string("₹ 33,458")} </div>
        </div>
      </div>
    </div>
  </div>
}
