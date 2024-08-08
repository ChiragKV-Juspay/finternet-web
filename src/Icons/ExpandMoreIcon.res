module ExpandMoreIcon = {
  @react.component @module("@mui/icons-material/ExpandMore")
  external make: unit => React.element = "default"
}

@react.component
let make = () => {
  <ExpandMoreIcon />
}
