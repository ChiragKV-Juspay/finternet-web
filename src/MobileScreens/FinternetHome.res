// open Colors

// @react.component
// let make = (~handleNavigate=?, ~isAppLinked=false) => {
//   <div className="flex flex-col gap-4">
//     <Header isFinternet={true} />
//     <AccountCard id="nandan@finternet" iconColor=colors.black />
//     <div className="my-2"> {React.string("Linked Applications")} </div>
//     <div className="flex flex-col items-center border border-gray-100 rounded-2xl p-5">
//       <img src="/NoAppsLinkedImage.svg" alt="Background Image" />
//       <div className="flex flex-col gap-4 w-full items-center">
//         <div> {React.string("No apps linked")} </div>
//         <button
//           className={`bg-black text-white text-xs rounded-lg w-1/3 h-8 `}
//           onClick={_ =>
//             switch handleNavigate {
//             | Some(callback) => callback()
//             | None => Js.log("No navigation function provided")
//             }}>
//           {React.string("Link Account")}
//         </button>
//       </div>
//     </div>
//     // <BankAccountCard handleNavigate={_ => handleNavigate()} />
//     // <div className="my-2"> {React.string("All Transactions")} </div>
//     // <TransactionsList />
//   </div>
// }

open Colors

type flow =
  | EmptyHome
  | HomeWithMyFin
  | HomeWithMyFinAndMyProp

@react.component
let make = (~handleNavigate=?, ~flow: flow) => {
  <div className="flex flex-col gap-4">
    <Header isFinternet={true} />
    <AccountCard iconColor=colors.black />
    <div className="my-2"> {React.string("Linked Applications")} </div>
    {switch flow {
    | EmptyHome =>
      <div className="flex flex-col items-center border border-gray-100 rounded-2xl p-5">
        <img src="/NoAppsLinkedImage.svg" alt="Background Image" />
        <div className="flex flex-col gap-4 w-full items-center">
          <div> {React.string("No apps linked")} </div>
          <button
            className="bg-black text-white text-xs rounded-lg w-1/3 h-8"
            onClick={_ =>
              switch handleNavigate {
              | Some(callback) => callback()
              | None => Js.log("No navigation function provided")
              }}>
            {React.string("Link Account")}
          </button>
        </div>
      </div>
    | HomeWithMyFin => <AppCard app={MyFin} amount="₹ 4800" />

    | HomeWithMyFinAndMyProp =>
      <div className="flex flex-col gap-3">
        <AppCard app={MyFin} amount="₹ 80,04,800" />
        <AppCard app={MyProp} amount="₹ 80,00,000" />
      </div>
    }}
  </div>
}
