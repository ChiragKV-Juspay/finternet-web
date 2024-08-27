open Colors

@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full justify-between">
    <div className="flex flex-col gap-5">
      <HeaderWithBack title="Add Property Documents" backButtonStrokeColor=colors.propertyBlue />
      <div className="flex flex-col gap-5">
        <div className="flex flew-row">
          <Mui.Checkbox
            defaultChecked=true
            style={{
              color: colors.propertyBlue,
            }}
            size=Small
          />
          <div className={`font-bold self-center text-xs text-[${colors.darkGray}]`}>
            {React.string("Ownership")}
          </div>
        </div>
        <div className="flex flew-row">
          <Mui.Checkbox
            defaultChecked=true
            style={{
              color: colors.propertyBlue,
            }}
            size=Small
          />
          <div className={`font-bold self-center text-xs text-[${colors.darkGray}]`}>
            {React.string("Value")}
          </div>
        </div>
        <div className="flex flew-row">
          <Mui.Checkbox
            defaultChecked=true
            style={{
              color: colors.propertyBlue,
            }}
            size=Small
          />
          <div className={`font-bold self-center text-xs text-[${colors.darkGray}]`}>
            {React.string("No Objection Certificate")}
          </div>
        </div>
      </div>
    </div>
    <div className="mt-14 gap-y-4 flex flex-col">
      <div
        className={`flex flex-row gap-2 w-10/12 bg-white p-2 rounded-xl drop-shadow-md self-center`}>
        <img src="/Info.svg" alt="Description of image" />
        <div className={`text-xs font-light text-[${colors.gray}]`}>
          {React.string("Your verifiable credentials are going to be issued by a registrar.")}
        </div>
      </div>
      <button
        className={` bg-[${colors.propertyBlue}] text-white rounded-lg w-full h-12`}
        onClick={_ => handleNavigate()}>
        {React.string("Add Property Documents")}
      </button>
      <SecuredByFinterest color={colors.propertyBlue} />
    </div>
  </div>
}
