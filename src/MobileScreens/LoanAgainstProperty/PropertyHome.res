@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col h-full justify-between ">
    <div className="flex flex-col gap-10">
      <Header />
      <div className="flex flex-col gap-4 ">
        <img src="/nandanAccountCard.svg" alt="Description of image" />
        <div className=" text-[#595959] text-xs"> {React.string("Financial Services")} </div>
        <CardWithButton
          title="Link your property"
          description="Link your property to apply for credit with collateral"
          buttonColor="#00B76A"
          onClick={_ => handleNavigate()}
        />
        <CardWithButton
          title="Apply for loan?"
          description="Access quick financing by leveraging your property today!"
          buttonColor="#D5D5D5"
          onClick={_ => handleNavigate()}
        />
      </div>
    </div>
    <SecuredByFinterest />
  </div>
}
