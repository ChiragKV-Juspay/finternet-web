open Colors

// type contactOptionsType = {
//   name: string,
//   imagePath: string,
//   amount: string,
//   transactionType: string,
// }

@react.component
let make = (~contact: ExampleData.contactOptionsType) => {
  let textColor = switch contact.transactionType {
  | Credited => `text-green`
  | Debited => `text-red`
  | _ => colors.black
  }
  let formatAmount = (contact: ExampleData.contactOptionsType): string => {
    switch contact.transactionType {
    | Credited => "+" ++ " ₹ " ++ contact.amount
    | Debited => "-" ++ " ₹ " ++ contact.amount
    }
  }

  <div className="flex flex-row justify-between mx-1">
    <div className="flex flex-row gap-3 ">
      <div className="flex flex-row gap-2">
        <img
          src={contact.imagePath}
          alt="Description of image"
          className="border border-white rounded-md"
        />
        <div className="w-px h-4 bg-[#E6E6E6] self-center" />
      </div>
      <div className="flex flex-col w-9/12">
        <div className="font-bold text-sm"> {React.string(contact.name)} </div>
        <div className={`text-xs text-[${colors.gray}]`}> {React.string(contact.finternetId)} </div>
      </div>
    </div>
    <div className={`text-xs font-bold self-center ${textColor} `}>
      {React.string(formatAmount(contact))}
    </div>
  </div>
}
