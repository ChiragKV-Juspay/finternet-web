open Colors

@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full justify-between">
    <div className="flex flex-col gap-10">
      <HeaderWithBack title="Tokenize your Property" backButtonStrokeColor="#0091FF" />
      <div className="flex flex-col gap-2">
        <div className=" text-[#797979] text-xs"> {React.string("Property ID")} </div>
        <Input
          placeholder="AXMD1EED"
          className=" p-3 border border-[#E6E6E6] rounded-lg text-sm placeholder-text-sm"
        />
      </div>
      <div className="flex flex-col gap-2">
        <div className=" text-[#797979] text-xs"> {React.string("Property Registrar")} </div>
        <Input
          placeholder="State Property Registrar"
          className=" p-3 border border-[#E6E6E6] rounded-lg text-sm placeholder-text-sm "
        />
      </div>
    </div>
    <div className="mt-14 gap-y-4 flex flex-col">
      <div className="flex flew-row ">
        <Mui.Checkbox
          defaultChecked=true
          style={{
            color: colors.propertyBlue,
          }}
          size=Small
        />
        <div className="flex flew-row flex-wrap gap-1 ">
          <div className="font-normal text-xs text-[#797979]">
            {React.string(
              "I hereby declare that the concerned property belongs to me and  is free of any encumbrance.",
            )}
          </div>
        </div>
      </div>
      <button
        className=" bg-[#0091FF] text-white rounded-lg w-full h-12" onClick={_ => handleNavigate()}>
        {React.string("Attest verifiable credentials")}
      </button>
      <SecuredByFinterest color={colors.propertyBlue} />
    </div>
    // <div className="flex flex-col gap-4">
    //   <button
    //     className=" bg-[#00B76A] text-white rounded-lg w-full h-10" onClick={_ => handleNavigate()}>
    //     {React.string("Proceed")}
    //   </button>
    //   <SecuredByFinterest />
    // </div>
  </div>
}
