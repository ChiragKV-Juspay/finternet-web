@react.component
let make = (~title, ~backButtonStrokeColor="#00B76A") => {
  <div className="flex flex-col gap-3">
    <div className="flex flex-row gap-2">
      <svg
        width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path
          d="M17.7188 12H20.2507"
          stroke=backButtonStrokeColor
          strokeWidth="1.5"
          strokeLinecap="square"
        />
        <path
          d="M4.24902 12H14.208"
          stroke=backButtonStrokeColor
          strokeWidth="1.5"
          strokeLinecap="square"
        />
        <path
          d="M9.90902 17.66C9.90902 14.75 7.34702 12 4.24902 12"
          stroke=backButtonStrokeColor
          strokeWidth="1.5"
          strokeLinecap="square"
        />
        <path
          d="M9.90902 6.33984C9.90902 9.24984 7.34702 11.9999 4.24902 11.9999"
          stroke=backButtonStrokeColor
          strokeWidth="1.5"
          strokeLinecap="square"
        />
      </svg>
      // <img src="/BackIcon.svg" alt="Description of image" />
      <div className="font-bold text-base"> {React.string(title)} </div>
    </div>
    <Divider />
  </div>
}
