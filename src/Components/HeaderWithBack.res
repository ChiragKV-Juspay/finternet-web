@react.component
let make = (~title) => {
  <div className="flex flex-col gap-3">
    <div className="flex flex-row gap-2">
      <img src="/BackIcon.svg" alt="Description of image" />
      <div className="font-bold text-base"> {React.string(title)} </div>
    </div>
    <Divider />
  </div>
}
