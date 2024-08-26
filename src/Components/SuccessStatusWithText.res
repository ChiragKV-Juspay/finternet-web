type colorsType = Green | Blue
@react.component
let make = (~text, ~descriptionText="", ~color=Green) => {
  let pathName = switch color {
  | Green => "/Success.svg"
  | Blue => "/SuccessBlue.svg"
  }
  <div className="flex flex-col gap-2 self-center w-9/12">
    <img src=pathName alt="Description of image" className="w-5/12 self-center" />
    <div className="font-bold text-xl self-center text-center "> {React.string(text)} </div>
    <div className="text-textGray self-center text-center "> {React.string(descriptionText)} </div>
  </div>
}
