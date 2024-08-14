module GitHubIcon = {
  @react.component @module("@mui/icons-material/GitHub")
  external make: unit => React.element = "default"
}

@react.component
let make = () => {
  <GitHubIcon />
}
