module ChevronDownIcon = {
  @react.component @module("@mui/icons-material/KeyboardArrowDown")
  external make: unit => React.element = "default"
}

@react.component
let make = () => {
  <ChevronDownIcon />
}
