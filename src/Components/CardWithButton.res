// @react.component
// let make = (~title, ~description, ~buttonColor) => {
//   <div
//     className="flex flex-col justify-center gap-2 p-4 border border-gray-100 drop-shadow-md rounded-2xl  ">
//     <div className="font-bold text-sm"> {React.string(title)} </div>
//     <div className="font-light text-[#797979] text-xs"> {React.string(description)} </div>
//     <button
//       className={` bg-[${buttonColor}] text-white rounded-lg w-2/6 h-9 text-xs `}
//       //   onClick={_ => onNavigateToFaceID()}
//     >
//       {React.string("Get Started")}
//     </button>
//   </div>
// }
@react.component
let make = (~title, ~description, ~buttonColor, ~onClick) => {
  <div
    className="flex flex-col justify-center gap-2 p-4 border border-gray-100 drop-shadow-md rounded-2xl">
    <div className="font-bold text-sm"> {React.string(title)} </div>
    <div className="font-light text-[#797979] text-xs"> {React.string(description)} </div>
    <button
      className={`bg-[${buttonColor}] text-white rounded-lg w-2/6 h-9 text-xs`}
      //  onClick={onClick}>
      // className={`bg-[#D5D5D5] text-white rounded-lg w-2/6 h-9 text-xs`}
      onClick={onClick}>
      {React.string("Get Started")}
    </button>
  </div>
}
