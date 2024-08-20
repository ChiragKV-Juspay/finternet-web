@react.component
let make = (~onNavigateToLinkProperty) => {
  <div className="flex flex-col h-full justify-between ">
    <div className="flex flex-col gap-10">
      <Header />
      <div className="flex flex-col gap-4 ">
        <img src="/nandanAccountCard.svg" alt="Description of image" />
        <div className=" text-[#595959] text-xs"> {React.string("Financial Services")} </div>
        //   <button
        //     className=" bg-[#00B76A] text-white rounded-lg w-full h-10"
        //     onClick={_ => onNavigateToFaceID()}>
        //     {React.string("Get Started")}
        //   </button>
        <CardWithButton
          title="Link your property"
          description="Link your property to apply for credit with collateral"
          buttonColor="#00B76A"
          onClick={_ => onNavigateToLinkProperty()}
        />
        <CardWithButton
          title="Apply for loan?"
          description="Access quick financing by leveraging your property today!"
          buttonColor="#00B76A"
          onClick={_ => onNavigateToLinkProperty()}
        />
      </div>
    </div>
    <SecuredByFinterest />
  </div>
}
