open Colors

@react.component
let make = (~id="siddharth@finternet", ~iconColor=colors.finternetGreen) => {
  // <img src="/NandanCard.svg" alt="Description of image" />
  // <div className="relative border rounded-2xl p-5 ">
  //   <img
  //     src="/GrayGradientBackground.svg" alt="Background Image" className="absolute right-0 z-0 -m-5"
  //   />

  <div className="relative border border-gray-100 rounded-2xl p-5 overflow-hidden  ">
    <img
      src="/GrayGradientBackground.svg" alt="Background Image" className="absolute right-0 z-0 -m-5"
    />
    <div className="h-full justify-between z-10">
      <div>
        <div
          className={`text-sm ${iconColor == colors.white
              ? `text-white`
              : `text-textGray`} font-normal z-10`}>
          {React.string("Account Address")}
        </div>
        <div className="flex flex-row justify-between ">
          <div
            className={`text-xl ${iconColor == colors.white
                ? `text-white`
                : ``} font-semibold z-10`}>
            {React.string(id)}
          </div>
          <div className="self-center z-10">
            <svg
              width="16"
              height="16"
              viewBox="0 0 16 16"
              fill="none"
              xmlns="http://www.w3.org/2000/svg">
              <g clipPath="url(#clip0_704_1354)">
                <path
                  d="M8.66683 13.3333C9.55056 13.3323 10.3978 12.9808 11.0227 12.3559C11.6476 11.731 11.9991 10.8837 12.0002 10V4.16201C12.0012 3.81159 11.9327 3.46444 11.7986 3.14069C11.6644 2.81694 11.4674 2.52304 11.2188 2.27601L9.72416 0.781345C9.47714 0.532794 9.18323 0.335747 8.85949 0.201625C8.53574 0.0675033 8.18859 -0.0010253 7.83816 1.15931e-05H4.66683C3.7831 0.00107017 2.93587 0.3526 2.31098 0.977492C1.68608 1.60238 1.33455 2.44962 1.3335 3.33335V10C1.33455 10.8837 1.68608 11.731 2.31098 12.3559C2.93587 12.9808 3.7831 13.3323 4.66683 13.3333H8.66683ZM2.66683 10V3.33335C2.66683 2.80291 2.87754 2.2942 3.25262 1.91913C3.62769 1.54406 4.1364 1.33335 4.66683 1.33335C4.66683 1.33335 7.94616 1.34268 8.00016 1.34935V2.66668C8.00016 3.0203 8.14064 3.35944 8.39069 3.60949C8.64074 3.85954 8.97988 4.00001 9.3335 4.00001H10.6508C10.6575 4.05401 10.6668 10 10.6668 10C10.6668 10.5304 10.4561 11.0392 10.081 11.4142C9.70597 11.7893 9.19726 12 8.66683 12H4.66683C4.1364 12 3.62769 11.7893 3.25262 11.4142C2.87754 11.0392 2.66683 10.5304 2.66683 10ZM14.6668 5.33335V12.6667C14.6658 13.5504 14.3142 14.3976 13.6894 15.0225C13.0645 15.6474 12.2172 15.999 11.3335 16H5.3335C5.15669 16 4.98712 15.9298 4.86209 15.8048C4.73707 15.6797 4.66683 15.5102 4.66683 15.3333C4.66683 15.1565 4.73707 14.987 4.86209 14.8619C4.98712 14.7369 5.15669 14.6667 5.3335 14.6667H11.3335C11.8639 14.6667 12.3726 14.456 12.7477 14.0809C13.1228 13.7058 13.3335 13.1971 13.3335 12.6667V5.33335C13.3335 5.15653 13.4037 4.98697 13.5288 4.86194C13.6538 4.73692 13.8234 4.66668 14.0002 4.66668C14.177 4.66668 14.3465 4.73692 14.4716 4.86194C14.5966 4.98697 14.6668 5.15653 14.6668 5.33335Z"
                  fill=iconColor
                />
              </g>
              <defs>
                <clipPath id="clip0_704_1354">
                  <rect width="16" height="16" fill="white" />
                </clipPath>
              </defs>
            </svg>
          </div>
        </div>
      </div>
      <SecuredByFinterest className="flex flew-row  items-center gap-1 mt-10" color=iconColor />
    </div>
  </div>
}
