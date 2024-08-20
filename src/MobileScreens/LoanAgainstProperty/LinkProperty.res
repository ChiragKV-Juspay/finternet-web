@react.component
let make = (~onNavigateToLinkedHome) => {
  <div className="flex flex-col h-full justify-between">
    <div className="flex flex-col gap-10">
      <HeaderWithBack title="Link Property" />
      <div className="flex flex-col gap-2">
        <div className="font-light text-[#797979] text-xs">
          {React.string("Select corporation")}
        </div>
        <img src="/DropdownBBMPSelect.svg" alt="Description of image" />
      </div>
      <div className="flex flex-col gap-2">
        <div className=" text-[#797979] text-xs"> {React.string("Enter Property ID")} </div>
        <Input
          placeholder="Enter property ID"
          className=" p-3 border border-[#E6E6E6]  rounded-lg text-sm placeholder-text-sm"
        />
      </div>
      <div className="flex flex-col gap-2">
        <div className="font-light text-[#797979] text-xs"> {React.string("Linking Status")} </div>
        <img src="/LinkingPropertyStepper.svg" alt="Description of image" />
      </div>
    </div>
    <div className="flex flex-col gap-4">
      <button
        className=" bg-[#00B76A] text-white rounded-lg w-full h-10"
        onClick={_ => onNavigateToLinkedHome()}>
        {React.string("Proceed")}
      </button>
      <SecuredByFinterest />
    </div>
  </div>
}
