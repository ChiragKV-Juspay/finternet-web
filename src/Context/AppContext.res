// // AppContext.res

// type state = {
//   data: option<string>,
//   setData: string => unit,
// }

// // module AppContext = {
// //   type theme = Light | Dark
// //   let context = React.createContext(Light)

// //   module Provider = {
// //     let make = React.Context.provider(context)
// //   }
// // }
// module AppContext = {
//   let context = React.createContext({
//     data: None,
//     setData: _ => (),
//   })
//   module Provider = {
//     let make = React.Context.provider(context)
//   }
// }
// @react.component
// let make = (~children) => {
//   let (data, setData) = React.useState(() => None)
//   //   let AppContext = React.createContext({
//   //     data: None,
//   //     setData: _ => (),
//   //   })
//   //   let fetchData = () => {
//   //     // Replace with your API call
//   //     Js.Promise.(
//   //       fetch("https://api.example.com/data")
//   //       |> then_(response => response.json())
//   //       |> then_(json => {
//   //         let data = Js.Json.decodeString(json)
//   //         switch data {
//   //         | Some(data) => setData(Some(data))
//   //         | None => ()
//   //         }
//   //         resolve()
//   //       })
//   //       |> catch(_ => resolve()))
//   //   }

//   //   React.useEffect0(() => {
//   //     fetchData()
//   //     None
//   //   })

//   //   let setDataCallback = React.useCallback1(setData)

//   <AppContext.Provider value={data, setData}> {children} </AppContext.Provider>
// }

