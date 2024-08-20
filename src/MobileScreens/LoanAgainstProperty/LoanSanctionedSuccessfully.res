@react.component
let make = (~handleNavigate) => {
  <div className="flex flex-col justify-end h-full gap-14">
    <img src="/LoanSanctionedSuccessfully.svg" alt="Description of image" />
    <div className="flex flex-col gap-5">
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10 text-sm"
        onClick={_ => handleNavigate()}>
        {React.string("Go to Home")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
