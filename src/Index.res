switch ReactDOM.querySelector("#root") {
| Some(rootElement) => {
    let root = ReactDOM.Client.createRoot(rootElement)
    ReactDOM.Client.Root.render(root, <App />)
  }
| None => Exn.raiseError("No element has ID of #root!")
}
