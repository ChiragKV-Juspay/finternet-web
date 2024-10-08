open Colors

@react.component
let make = (~handleNavigate) => {
  <div className=" flex flex-col h-full justify-between ">
    <div className="flex flex-col gap-2 z-10">
      <BlueHeader />
      <div className="flex flex-col gap-4 z-10">
        <AccountCard id="siddharth@finternet" iconColor=colors.propertyBlue />
        // <img src="/NandanBlueAccountCard.svg" alt="Description of image" />
        <div className=" text-[#595959] text-xs"> {React.string("Financial Services")} </div>
        <CardWithButton
          title="Link your property"
          description="Link your property to apply for credit with collateral"
          buttonColor="primaryBlue"
          onClick={_ => handleNavigate()}
        />
        <CardWithButton
          title="Apply for loan?"
          description="Access quick financing by leveraging your property today!"
          buttonColor="disabledGray"
          onClick={_ => handleNavigate()}
        />
      </div>
    </div>
    <SecuredByFinterest color={colors.propertyBlue} />
  </div>
}
