@react.component
let make = (~onNavigateToLinkCredentials) => {
  <div className="flex flex-col h-full justify-between">
    <div className="flex flex-col gap-7">
      <HeaderWithBack title="Fill Loan Application" />
      <div className="flex flex-col gap-2">
        <div className=" text-[#797979] text-xs"> {React.string("Select a property")} </div>
        <img src="/SelectPropertyDropdown.svg" alt="Description of image" />
      </div>
      <div className="flex flex-col gap-2">
        <div className=" text-[#797979] text-xs"> {React.string("Type of Loan")} </div>
        <img src="/TypeOfLoanDropdown.svg" alt="Description of image" />
      </div>
      <div className="flex flex-col gap-2">
        <div className=" text-[#797979] text-xs"> {React.string("Required Loan Amount")} </div>
        <div className="flex flex-row border border-[#E6E6E6] rounded-lg">
          <div className="flex flex-row  ml-4 items-center ">
            <div className="font-normal text-base"> {React.string("₹")} </div>
          </div>
          <Input placeholder="Enter the amount" />
        </div>
      </div>
      <div className="flex flex-col gap-2">
        <div className="text-[#797979] text-xs"> {React.string("Tenure")} </div>
        <div className="flex flex-row border border-[#E6E6E6] rounded-lg">
          <Input placeholder="Enter the tenure" />
          <div className="flex flex-row  mr-4  items-center ">
            <div className="font-normal text-base"> {React.string("years")} </div>
          </div>
        </div>
      </div>
      <div className="flex flex-col gap-2">
        <div className=" text-[#797979] text-xs"> {React.string("Disbursal Account")} </div>
        <img src="/AwesomeBankSelectedDropdown.svg" alt="Description of image" />
      </div>
    </div>
    <div className="flex flex-col gap-4">
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10"
        onClick={onNavigateToLinkCredentials}>
        {React.string("Next")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
