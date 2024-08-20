@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full justify-between">
    <div>
      <div>
        <div className="font-bold text-4xl text-[#00B76A]"> {React.string("Hey!")} </div>
        <div className="mt-10 ">
          <div className="font-bold text-xl"> {React.string("Welcome to Finternet")} </div>
          <div className="font-light text-sm mt-4">
            {React.string(
              "Access all assets via a unified interface and unlock the potential of seamless global transactions",
            )}
          </div>
        </div>
      </div>
      <div className="mt-14 gap-4 flex flex-col">
        <div className="font-medium text-base"> {React.string("Enter your mobile number")} </div>
        <div className="flex flex-row border border-[#E6E6E6] rounded-lg">
          <div className="flex flex-row  ml-4 gap-2 items-center ">
            <img src="/IndiaFlag.svg" alt="Description of image" />
            <div className="font-normal text-base"> {React.string("+91")} </div>
            <svg
              width="12"
              height="8"
              viewBox="0 0 12 8"
              fill="none"
              xmlns="http://www.w3.org/2000/svg">
              <path
                d="M5.58917 7.03844C5.37032 7.03882 5.15357 6.99595 4.95135 6.91229C4.74913 6.82862 4.56544 6.70582 4.41083 6.55094L0 2.13927L1.17833 0.960938L5.58917 5.37177L10 0.960938L11.1783 2.13927L6.7675 6.5501C6.61296 6.70514 6.4293 6.82809 6.22708 6.9119C6.02486 6.99571 5.80807 7.03871 5.58917 7.03844Z"
                fill="#00B76A"
              />
            </svg>
          </div>
          <Input placeholder="Enter your mobile number" />
        </div>
        <div className="font-light text-sm">
          {React.string("An OTP will be sent to the linked mobile number for verification")}
        </div>
      </div>
    </div>
    <div className="mt-14 gap-y-4 flex flex-col">
      <div className="flex flew-row ">
        <Mui.Checkbox
          defaultChecked=true
          style={{
            color: "#00B76A",
          }}
          size=Small
        />
        <div className="flex flew-row flex-wrap gap-1 ">
          <div className="font-normal text-sm">
            {React.string("By registering, you accept our")}
          </div>
          <div className="font-normal text-sm text-[#00B76A]">
            {React.string("Terms of Use ")}
          </div>
          <div className="font-normal text-sm"> {React.string("&")} </div>
          <div className="font-normal text-sm text-[#00B76A]">
            {React.string("Privacy Policy")}
          </div>
        </div>
      </div>
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-12" onClick={_ => handleNavigate()}>
        {React.string("Verify")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}

// @react.component
// let make = (~handleNavigate) => {
//   <div className="flex flex-col h-full justify-between">
//     <div>
//       <div>
//         <div className="font-bold text-[3vw] text-[#00B76A]"> {React.string("Hey!")} </div>
//         <div className="mt-[5vw]">
//           <div className="font-bold text-[2vw]"> {React.string("Welcome to Finternet")} </div>
//           <div className="font-light text-[1vw] mt-[2vw]">
//             {React.string(
//               "Access all assets via a unified interface and unlock the potential of seamless global transactions",
//             )}
//           </div>
//         </div>
//       </div>
//       <div className="mt-[7vw] gap-[2vw] flex flex-col">
//         <div className="font-medium text-[2.5vw]"> {React.string("Enter your mobile number")} </div>
//         <div className="flex flex-row border border-[#E6E6E6] rounded-lg">
//           <div className="flex flex-row ml-[2vw] gap-[1vw] items-center">
//             <div className="font-normal text-[2.5vw]"> {React.string("+1")} </div>
//             <svg
//               width="12"
//               height="8"
//               viewBox="0 0 12 8"
//               fill="none"
//               xmlns="http://www.w3.org/2000/svg">
//               <path
//                 d="M5.58917 7.03844C5.37032 7.03882 5.15357 6.99595 4.95135 6.91229C4.74913 6.82862 4.56544 6.70582 4.41083 6.55094L0 2.13927L1.17833 0.960938L5.58917 5.37177L10 0.960938L11.1783 2.13927L6.7675 6.5501C6.61296 6.70514 6.4293 6.82809 6.22708 6.9119C6.02486 6.99571 5.80807 7.03871 5.58917 7.03844Z"
//                 fill="#00B76A"
//               />
//             </svg>
//           </div>
//           <input
//             placeholder="Enter your mobile number"
//             className="flex-1 p-[1vw] text-[2vw] outline-none rounded-lg w-[60%]"
//           />
//         </div>
//         <div className="font-light text-[2vw]">
//           {React.string("An OTP will be sent to the linked mobile number for verification")}
//         </div>
//       </div>
//     </div>
//     <div className="mt-[7vw] gap-y-[2vw] flex flex-col">
//       <div className="flex flex-row">
//         <Mui.Checkbox
//           defaultChecked=true
//           style={{
//             color: "#00B76A",
//           }}
//           size=Small
//         />
//         <div className="flex flex-row flex-wrap gap-[0.5vw]">
//           <div className="font-normal text-[2vw]">
//             {React.string("By registering, you accept our")}
//           </div>
//           <div className="font-normal text-[2vw] text-[#00B76A]">
//             {React.string("Terms of Use ")}
//           </div>
//           <div className="font-normal text-[2vw]"> {React.string("&")} </div>
//           <div className="font-normal text-[2vw] text-[#00B76A]">
//             {React.string("Privacy Policy")}
//           </div>
//         </div>
//       </div>
//       <button
//         className="bg-[#00B76A] text-white rounded-lg w-full h-[10vw]"
//         onClick={_ => handleNavigate()}>
//         {React.string("Verify")}
//       </button>
//       <SecuredByFinterest />
//     </div>
//   </div>
// }
