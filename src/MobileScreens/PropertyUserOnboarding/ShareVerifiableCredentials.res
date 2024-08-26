open Colors

@react.component
let make = (~handleNavigate) => {
  let (showModal, setShowModal) = React.useState(_ => false)

  let toggleModal = () => {
    setShowModal(prev => !prev)
  }
  let onButtonPress = () => {
    toggleModal()
  }
  <div className="flex flex-col h-full justify-between relative">
    <div className="flex flex-col gap-5">
      <HeaderWithBack
        title="Attesting verifiable credentials" backButtonStrokeColor=colors.propertyBlue
      />
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
            {React.string("NOC")}
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
            {React.string("Personal Details")}
          </div>
        </div>
      </div>
    </div>
    <div className="mt-14 gap-y-4 flex flex-col">
      <button
        className={` bg-[${colors.propertyBlue}] text-white rounded-lg w-full h-12`}
        onClick={_ => onButtonPress()}>
        {React.string("View Offers")}
      </button>
      <SecuredByFinterest color={colors.propertyBlue} />
    </div>
    <LinkToFinternetModal
      showModal={showModal}
      toggleModal={toggleModal}
      handleNavigate={handleNavigate}
      text="By proceeding, you are consenting to share your property documents with a third party."
      buttonText="Proceed"
    />
  </div>
}
