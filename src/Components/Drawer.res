// @react.component
// let make = (~openDrawer, ~setOpenDrawer, ~handleDrawerSelection) => {
//   //  ~handleDrawerSelection

//   let toggleDrawer = (event: ReactEvent.Synthetic.t, reason: Mui.Modal.reason) => {
//     setOpenDrawer(_ => false)
//   }

//   let moneyUseCases = ["User Onboarding", "Domestic Money Transfer"]

//   let propertyUseCases = ["User Onboarding", "Loan Against Property"]

//   let renderSection = (title, items) => {
//     <div>
//       <Mui.List>
//         <Mui.ListSubheader> {React.string(title)} </Mui.ListSubheader>
//         {items
//         ->Belt.Array.map(item =>
//           <Mui.ListItem key={item} disablePadding={true}>
//             <Mui.ListItemButton
//               onClick={_ => {
//                 handleDrawerSelection(item)
//                 setOpenDrawer(_ => false)
//               }}>
//               <Mui.ListItemText primary={React.string(item)} />
//             </Mui.ListItemButton>
//           </Mui.ListItem>
//         )
//         ->React.array}
//       </Mui.List>
//       <Mui.Divider />
//     </div>
//   }

//   let drawerContent =
//     // <div role="presentation" onClick={_ => setOpenDrawer(_ => false)}>
//     <Mui.Box
//     //  sx={display: "flex"}
//     >
//       {renderSection("Money use cases", moneyUseCases)}
//       {renderSection("Property use cases (Coming Soon)", propertyUseCases)}
//     </Mui.Box>
//   // </div>

//   <Mui.Drawer open_={openDrawer} onClose={toggleDrawer} variant={Permanent}>
//     {drawerContent}
//   </Mui.Drawer>
// }

@react.component
let make = (~handleDrawerSelection, ~selectedOption) => {
  let moneyUseCases = ["User Onboarding", "Domestic Money Transfer"]
  let propertyUseCases = ["Property User Onboarding", "Loan Against Property"]
  let home = ["Hello World!", "Finternet Onboarding"]

  let renderSection = (title, items) => {
    <div className="flex flex-col gap-2">
      <div className="font-bold"> {React.string(title)} </div>
      {items
      ->Belt.Array.map(item => {
        <div
          key={item}
          className={"cursor-pointer p-2 rounded " ++
          switch selectedOption {
          | selected if selected == item => "bg-gray-100"
          | _ => "bg-white "
          }}
          onClick={_ => handleDrawerSelection(item)}>
          {React.string(item)}
        </div>
      })
      ->React.array}
      <hr className="mt-2 p-1" />
    </div>
  }

  <div className="flex flex-col gap-4 w-64 hidden sm:block border-r h-full p-4">
    // <Mui.StyledEngineProvider injectFirst=true>
    {renderSection("Home", home)}
    {renderSection("Money use cases", moneyUseCases)}
    {renderSection("Property use cases (Coming Soon)", propertyUseCases)}

    // </Mui.StyledEngineProvider>
  </div>
}
