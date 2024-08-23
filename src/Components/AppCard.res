open Colors

type app =
  | MyFin
  | MyProp

@react.component
let make = (~app, ~iconColor=colors.finternetGreen, ~amount) => {
  let (imagePath, appName, bankDescription, color) = switch app {
  | MyFin => (
      "/MyFinLogo.svg",
      "MyFin",
      "ABC Bank Account Balance",
      `text-[${colors.finternetGreen}]`,
    )
  | MyProp => (
      "/MyPropLogo.svg",
      "MyProp",
      "ABC Bank Sanctioned Loan",
      `text-[${colors.propertyBlue}]`,
    )
  }

  <div className="border border-gray-100 rounded-2xl p-5 ">
    <div className="flex flex-col gap-4 ">
      <div className="flex flex-row justify-between">
        <div className=" flex flex-row gap-2">
          <img src=imagePath />
          <div className={`${color} text-2xl font-medium`}> {React.string(appName)} </div>
        </div>
        <div> {React.string(">")} </div>
      </div>
      <div className="flex flex-col gap-1">
        <div className="text-lg  text-[#797979]"> {React.string(bankDescription)} </div>
        <div className="font-bold text-2xl"> {React.string(amount)} </div>
      </div>
    </div>
  </div>
}
