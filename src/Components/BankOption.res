@react.component
let make = (~onClick, ~isSelected, ~bankDetails: ExampleData.bankOptionsType) => {
  Console.log(bankDetails)
  <div className="flex flex-row justify-between mx-1 cursor-pointer " onClick={onClick}>
    <div className="flex flex-row gap-3">
      <div className="flex flex-row gap-2">
        <img src={bankDetails.imagePath} alt="Description of image" />
        <div className="w-px h-4 bg-[#E6E6E6] self-center" />
      </div>
      <div className="flex flex-col ">
        <div className=" font-bold text-sm"> {React.string(bankDetails.name)} </div>
        <div className=" text-xs"> {React.string(bankDetails.description)} </div>
      </div>
    </div>
    {isSelected
      ? <img src="/RadioButtonSelected.svg" alt="Description of image" />
      : <img src="/RadioButtonUnselected.svg" alt="Description of image" />}
  </div>
}
