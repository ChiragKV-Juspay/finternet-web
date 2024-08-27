@react.component
let make = (~flag, ~children) => {
  <div className={flag ? "p-4" : ""}> {children} </div>
}
