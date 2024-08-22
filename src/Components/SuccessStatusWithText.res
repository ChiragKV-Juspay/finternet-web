type colorsType = Green | Blue
@react.component
let make = (~text, ~color=Green) => {
  let pathName = switch color {
  | Green => "/Success.svg"
  | Blue => "/SuccessBlue.svg"
  }
  <div className="flex flex-col gap-2 self-center w-9/12">
    <img src=pathName alt="Description of image" className="w-5/12 self-center" />
    <div className="font-bold self-center text-center "> {React.string(text)} </div>
  </div>
}
