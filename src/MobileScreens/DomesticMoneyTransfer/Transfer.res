@react.component
let make = (~onNavigateToEnterAmount) => {
  <div className="flex flex-col h-full gap-4 ">
    <HeaderWithBack title="Transfer" />
    <div className="flex flex-col gap-1 my-3 ">
      <div className="font-bold text-lg"> {React.string("Who are you sending to?")} </div>
      <div className="flex justify-start">
        <SecuredByFinterest />
      </div>
    </div>
    // <div>
    //   <img src="/TransferHeader.svg" alt="Description of image" />
    //   <img src="/SendingToHeader.svg" alt="Description of image" />
    // </div>
    <Input
      placeholder="Enter mobile number/name/account"
      className=" p-2 text-base border border-[#E6E6E6]  rounded-lg text-sm"
    />
    <div>
      <img src="/RecentTransactionsHeader.svg" alt="Description of image" />
      <img src="/SelectedContact.svg" alt="Description of image" />
      // <div className="flex flex-row border border-[#E6E6E6] rounded-lg">
      //   <div className="flex flex-row  ml-2 gap-2 items-center ">
      //     <svg
      //       width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
      //       <g clipPath="url(#clip0_704_1470)">
      //         <path
      //           d="M10 20C15.5228 20 20 15.5228 20 10C20 4.47715 15.5228 0 10 0C4.47715 0 0 4.47715 0 10C0 15.5228 4.47715 20 10 20Z"
      //           fill="#F0F0F0"
      //         />
      //         <path
      //           d="M9.56519 10.0003H20C20 9.09773 19.8796 8.22336 19.6555 7.3916H9.56519V10.0003Z"
      //           fill="#D80027"
      //         />
      //         <path
      //           d="M9.56519 4.78254H18.5322C17.9201 3.78363 17.1374 2.9007 16.2248 2.17383H9.56519V4.78254Z"
      //           fill="#D80027"
      //         />
      //         <path
      //           d="M9.99999 20.0001C12.3535 20.0001 14.5166 19.1866 16.2248 17.8262H3.77515C5.48335 19.1866 7.64651 20.0001 9.99999 20.0001Z"
      //           fill="#D80027"
      //         />
      //         <path
      //           d="M1.46772 15.2171H18.5323C19.0237 14.4152 19.4048 13.5386 19.6555 12.6084H0.344482C0.595146 13.5386 0.976279 14.4152 1.46772 15.2171Z"
      //           fill="#D80027"
      //         />
      //         <path
      //           d="M4.63219 1.56164H5.54348L4.69582 2.17746L5.01961 3.17391L4.17199 2.55809L3.32437 3.17391L3.60406 2.31309C2.85773 2.93477 2.20359 3.66313 1.66453 4.47469H1.95652L1.41695 4.86668C1.33289 5.00691 1.25227 5.14937 1.175 5.29395L1.43266 6.08695L0.951953 5.7377C0.832461 5.99086 0.723164 6.24973 0.624922 6.51398L0.908789 7.38773H1.95652L1.10887 8.00356L1.43266 9L0.585039 8.38418L0.0773047 8.75309C0.0264844 9.1616 0 9.57769 0 10H10C10 4.47719 10 3.82609 10 0C8.02453 0 6.18301 0.573047 4.63219 1.56164ZM5.01961 9L4.17199 8.38418L3.32437 9L3.64816 8.00356L2.80051 7.38773H3.84824L4.17199 6.39129L4.49574 7.38773H5.54348L4.69582 8.00356L5.01961 9ZM4.69582 5.09051L5.01961 6.08695L4.17199 5.47113L3.32437 6.08695L3.64816 5.09051L2.80051 4.47469H3.84824L4.17199 3.47824L4.49574 4.47469H5.54348L4.69582 5.09051ZM8.60656 9L7.75895 8.38418L6.91133 9L7.23512 8.00356L6.38746 7.38773H7.4352L7.75895 6.39129L8.0827 7.38773H9.13043L8.28277 8.00356L8.60656 9ZM8.28277 5.09051L8.60656 6.08695L7.75895 5.47113L6.91133 6.08695L7.23512 5.09051L6.38746 4.47469H7.4352L7.75895 3.47824L8.0827 4.47469H9.13043L8.28277 5.09051ZM8.28277 2.17746L8.60656 3.17391L7.75895 2.55809L6.91133 3.17391L7.23512 2.17746L6.38746 1.56164H7.4352L7.75895 0.565195L8.0827 1.56164H9.13043L8.28277 2.17746Z"
      //           fill="#0052B4"
      //         />
      //       </g>
      //       <defs>
      //         <clipPath id="clip0_704_1470">
      //           <rect width="20" height="20" fill="white" />
      //         </clipPath>
      //       </defs>
      //     </svg>
      //     <div className="font-normal text-base"> {React.string("USD")} </div>
      //     <svg
      //       width="12" height="8" viewBox="0 0 12 8" fill="none" xmlns="http://www.w3.org/2000/svg">
      //       <path
      //         d="M5.58917 7.03844C5.37032 7.03882 5.15357 6.99595 4.95135 6.91229C4.74913 6.82862 4.56544 6.70582 4.41083 6.55094L0 2.13927L1.17833 0.960938L5.58917 5.37177L10 0.960938L11.1783 2.13927L6.7675 6.5501C6.61296 6.70514 6.4293 6.82809 6.22708 6.9119C6.02486 6.99571 5.80807 7.03871 5.58917 7.03844Z"
      //         fill="#00B76A"
      //       />
      //     </svg>
      //   </div>
      //   <input
      //     // type="tel"
      //     placeholder="Enter amount"
      //     className="flex-1 p-2 text-base outline-none  rounded-lg w-4/5"
      //     // style="border: none;"
      //   />
      //   // <div className="font-medium text-base"> {React.string("Enter your mobile number")} </div>
      // </div>
      <div className="flex justify-end">
        <button
          className="bg-[#00B76A] text-white rounded-lg w-4/5 h-10"
          onClick={onNavigateToEnterAmount}>
          {React.string("Proceed")}
        </button>
      </div>
    </div>
    <div className="flex flex-col gap-3 mt-2">
      <img src="/DottedDivider.svg" alt="Description of image" />
      <img src="/Contact1.svg" alt="Description of image" />
      <img src="/DottedDivider.svg" alt="Description of image" />
      <img src="/Contact2.svg" alt="Description of image" />
      <img src="/DottedDivider.svg" alt="Description of image" />
      <img src="/Contact3.svg" alt="Description of image" />
    </div>
  </div>
}
