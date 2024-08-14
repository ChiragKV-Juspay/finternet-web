@react.component
let make = (~openDrawer, ~setOpenDrawer, ~handleDrawerSelection) => {
  //  ~handleDrawerSelection

  let toggleDrawer = (event: ReactEvent.Synthetic.t, reason: Mui.Modal.reason) => {
    setOpenDrawer(_ => false)
  }

  let moneyUseCases = ["User Onboarding", "Domestic Money Transfer"]

  let propertyUseCases = ["User Onboarding", "Loan Against Property"]

  let renderSection = (title, items) => {
    <div>
      <Mui.List>
        <Mui.ListSubheader> {React.string(title)} </Mui.ListSubheader>
        {items
        ->Belt.Array.map(item =>
          <Mui.ListItem key={item} disablePadding={true}>
            <Mui.ListItemButton
              onClick={_ => {
                handleDrawerSelection(item)
                setOpenDrawer(_ => false)
              }}>
              <Mui.ListItemText primary={React.string(item)} />
            </Mui.ListItemButton>
          </Mui.ListItem>
        )
        ->React.array}
      </Mui.List>
      <Mui.Divider />
    </div>
  }

  let drawerContent =
    <div role="presentation" onClick={_ => setOpenDrawer(_ => false)}>
      <Mui.Box>
        {renderSection("Money use cases", moneyUseCases)}
        {renderSection("Property use cases (Coming Soon)", propertyUseCases)}
      </Mui.Box>
    </div>

  <Mui.Drawer open_={openDrawer} onClose={toggleDrawer}> {drawerContent} </Mui.Drawer>
}
