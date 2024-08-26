open Colors

@react.component
let make = (~isFinternet=false) => {
  <div className="flex flex-row justify-between">
    {isFinternet
      ? <img src="/FinternetLogoWhite.png" alt="Description of image" className=" h-1/12 w-1/12" />
      : <svg
          width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path
            d="M11.023 10.4776C12.3526 8.66576 15.2414 7.39603 17.4753 7.64158L20.9808 8.02691C23.2147 8.27246 23.9478 9.94031 22.6182 11.7522L16.0378 20.7192C14.7082 22.531 11.8194 23.8008 9.5855 23.5552L6.07997 23.1699C3.84607 22.9243 3.11299 21.2565 4.4426 19.4447L11.023 10.4776Z"
            fill="url(#paint0_linear_704_1338)"
          />
          <path
            d="M8.988 3.28046C10.3176 1.46862 13.2064 0.198893 15.4403 0.444445L18.9458 0.829775C21.1797 1.07533 21.9128 2.74317 20.5832 4.55502L14.0028 13.5221C12.6732 15.3339 9.7844 16.6036 7.5505 16.3581L4.04497 15.9728C1.81107 15.7272 1.07799 14.0594 2.4076 12.2475L8.988 3.28046Z"
            fill="url(#paint1_linear_704_1338)"
          />
          <defs>
            <linearGradient
              id="paint0_linear_704_1338"
              x1="12.5129"
              y1="0.414062"
              x2="12.5129"
              y2="23.5856"
              gradientUnits="userSpaceOnUse">
              <stop stopColor="#00DD8B" />
              <stop offset="1" stopColor="#009217" />
            </linearGradient>
            <linearGradient
              id="paint1_linear_704_1338"
              x1="17.193"
              y1="0.637001"
              x2="15.3705"
              y2="17.2176"
              gradientUnits="userSpaceOnUse">
              <stop stopColor="#0AEDB0" />
              <stop offset="1" stopColor="#7FFD00" stopOpacity="0.55" />
            </linearGradient>
          </defs>
        </svg>}
    <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path
        d="M6.44101 11.1056C6.44101 7.62135 9.26548 4.79688 12.7497 4.79688C16.2338 4.79688 19.0583 7.62136 19.0583 11.1055V13.8987C19.0583 15.785 19.6317 17.6267 20.7025 19.1797H4.79688C5.86761 17.6267 6.44101 15.785 6.44101 13.8987V11.1056Z"
        stroke={isFinternet ? colors.white : "#00B76A"}
        strokeWidth="1.5"
      />
      <path opacity="0.4" d="M12.75 4.79724V2.63867" stroke="#00B76A" strokeWidth="1.5" />
      <path
        opacity="0.4"
        d="M15.9785 19.1797V19.4101C15.9785 21.1932 14.5331 22.6386 12.75 22.6386C10.9669 22.6386 9.52148 21.1932 9.52148 19.4101V19.1797"
        stroke={isFinternet ? colors.white : "#00B76A"}
        strokeWidth="1.5"
      />
    </svg>
  </div>
}
