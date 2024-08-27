@react.component
let make = () => {
  let (option, setOption) = React.useState(_ => "Tickets")
  let handleChange = (e, _) => setOption((e->ReactEvent.Form.target)["value"])
  // JSX for rendering the form

  <Mui.FormControl fullWidth={true}>
    <Mui.Select
      value={option}
      onChange={handleChange}
      // defaultValue={"Tickets"}
      // sx={
      // }}
      sx={Mui.Sx.array([
        Mui.Sx.Array.obj({
          // "& .MuiSelect-select": {
          //   border: Number(1.0),
          // },
          // border: Number(1.0),
          // borderColor: String("#000"),
          borderRadius: Number(4.0),
          // padding: Number(-1.0),
        }),
      ])}
      id="demo-simple-select"
      // variant=Outlined
      //   displayEmpty=true

      //   inputProps={{ 'aria-label': 'Without label' }}
    >
      <Mui.MenuItem value={"Tickets"}> {React.string("Tickets")} </Mui.MenuItem>
      <Mui.MenuItem value={"Books"}> {React.string("Books")} </Mui.MenuItem>
      <Mui.MenuItem value={"Food"}> {React.string("Food")} </Mui.MenuItem>
    </Mui.Select>
  </Mui.FormControl>
}
