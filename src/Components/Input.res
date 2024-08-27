@react.component
let make = (~placeholder: string, ~className: string=?, ~onChange=?, ~value=?) => {
  let inputValue = switch value {
  | Some(v) => v
  | None => ""
  }
  <input
    placeholder
    className={className->Belt.Option.getWithDefault(
      "flex-1 p-2 text-base outline-none rounded-2xl w-4/5 text-sm",
    )}
    // onChange={switch onChange {
    // | Some(f) => f
    // | None => _ => ()
    // }}
    // value={inputValue}212
  />
}
