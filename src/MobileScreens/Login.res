open Colors

type flowType =
  | FinternetOnboarding
  | PropertyOnboarding
  | MoneyTransferOnboarding

@react.component
let make = (~handleNavigate, ~flow: flowType) => {
  let (showModal, setShowModal) = React.useState(_ => false)

  let toggleModal = () => {
    setShowModal(prev => !prev)
  }

  let (
    backgroundImagePath,
    logoPath,
    color,
    bgShade1,
    bgShade2,
    bgShade3,
    bgShade4,
    appName,
    welcomeMessage,
    descriptionMessage,
    imageClass,
  ) = switch flow {
  | FinternetOnboarding => (
      "/BackgroundImage.svg",
      "",
      colors.white,
      "#292929",
      "#474747",
      "#666666",
      "#8F8F8F",
      "Hey!",
      "Welcome to Finternet",
      "Access all assets via a unified interface and unlock the potential of seamless global transactions",
      "absolute z-0 -m-4",
    )
  | PropertyOnboarding => (
      "/BackgroundBlueGradient.svg",
      "/MyPropLogo.svg",
      "#0091FF",
      "#F0FFF9",
      "#EAFFF6",
      "#E6FFF4",
      "#DBFFF0",
      "MyProp",
      "Welcome to MyProp",
      "Access your property via a unified interface and unlock the power of seamless transactability.",
      "absolute z-0 scale-110 w-full",
    )
  | MoneyTransferOnboarding => (
      "/BackgroundImage.svg",
      "/MyFinLogo.svg",
      "#00B76A",
      "#F0FFF9",
      "#EAFFF6",
      "#E6FFF4",
      "#DBFFF0",
      "MyFin",
      "Welcome to MyFin",
      "Access transactiblity via a unified interface and unlock the potential of seamless global transactions",
      "absolute z-0 -m-4",
    )
  }

  let onButtonPress = () => {
    switch flow {
    | FinternetOnboarding | MoneyTransferOnboarding => handleNavigate()
    | PropertyOnboarding => toggleModal()
    }
  }

  <div className="relative flex flex-col h-full justify-between">
    {switch flow {
    | MoneyTransferOnboarding =>
      <div className=imageClass>
        <svg
          width="390"
          height="178"
          viewBox="0 0 390 178"
          fill="none"
          xmlns="http://www.w3.org/2000/svg">
          <g clipPath="url(#clip0_1137_2884)">
            <path
              d="M442.469 -10.0171L239.271 -190L-97.8634 231.191L442.469 -10.0171Z"
              fill=bgShade1
              fillOpacity="0.6"
            />
            <path
              d="M268.073 -12.3014L81.292 -132.288L-144.49 259.888L268.073 -12.3014Z"
              fill=bgShade2
              fillOpacity="0.6"
            />
            <path
              d="M142.265 -12.5122L-74.1484 -62L-147.554 357.697L142.265 -12.5122Z" fill=bgShade3
            />
            <path d="M79 0H-143L-121 425.5L79 0Z" fill=bgShade4 />
          </g>
          <defs>
            <clipPath id="clip0_1137_2884">
              <rect width="390" height="178" fill="white" />
            </clipPath>
          </defs>
        </svg>
      </div>

    | PropertyOnboarding =>
      <div className=imageClass>
        <img src=backgroundImagePath alt="Description of image" className="w-full" />
      </div>

    | _ => React.null
    }}
    <div className="z-10 h-1">
      <div>
        {flow == FinternetOnboarding
          ? <img
              src="/FinternetLogoWhite.png" alt="Description of image" className="h-6/12 w-3/12"
            />
          : <div className="flex flex-row gap-2">
              <img src=logoPath alt="Description of image" className="h-3/12 w-1/12 self-center" />
              <div className={`font-bold text-4xl text-[${color}]`}> {React.string(appName)} </div>
            </div>}
        <div className="mt-10">
          <div
            className={`font-bold ${flow == FinternetOnboarding
                ? "text-2xl text-white"
                : "text-xl"}`}>
            {React.string(welcomeMessage)}
          </div>
          <div
            className={`font-light text-sm mt-4 ${flow == FinternetOnboarding
                ? "text-white"
                : ""}`}>
            {React.string(descriptionMessage)}
          </div>
        </div>
      </div>
      {flow == FinternetOnboarding
        ? <div className="mt-14 gap-4 flex flex-col">
            <div className="font-medium text-base text-white">
              {React.string("Enter your mobile number")}
            </div>
            <div className="flex flex-row border border-[#E6E6E6] rounded-lg">
              <div className="flex flex-row ml-4 gap-2 items-center ">
                <img src="/IndiaFlag.svg" alt="Description of image" />
                <div className="font-normal text-base text-white"> {React.string("+91")} </div>
                <svg
                  width="12"
                  height="8"
                  viewBox="0 0 12 8"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg">
                  <path
                    d="M5.58917 7.03844C5.37032 7.03882 5.15357 6.99595 4.95135 6.91229C4.74913 6.82862 4.56544 6.70582 4.41083 6.55094L0 2.13927L1.17833 0.960938L5.58917 5.37177L10 0.960938L11.1783 2.13927L6.7675 6.5501C6.61296 6.70514 6.4293 6.82809 6.22708 6.9119C6.02486 6.99571 5.80807 7.03871 5.58917 7.03844Z"
                    fill={color}
                  />
                </svg>
              </div>
              <Input
                placeholder="Enter your mobile number"
                className="bg-black flex-1 p-2 text-base outline-none rounded-lg w-4/5 text-sm text-white placeholder-white"
              />
            </div>
          </div>
        : React.null}
    </div>
    <div className="gap-y-4 flex flex-col">
      <div className="flex flew-row">
        <Mui.Checkbox
          defaultChecked=true
          style={{
            color: color,
          }}
          size=Small
        />
        <div className="flex flew-row flex-wrap gap-1 ">
          <div className={`font-normal text-sm ${flow == FinternetOnboarding ? "text-white" : ""}`}>
            {React.string("By registering, you accept our")}
          </div>
          <div
            className={`font-normal text-sm ${flow == FinternetOnboarding
                ? "text-white"
                : "text-[${color}]"} `}>
            {React.string("Terms of Use")}
          </div>
          <div className={`font-normal text-sm ${flow == FinternetOnboarding ? "text-white" : ""}`}>
            {React.string("&")}
          </div>
          <div
            className={`font-normal text-sm ${flow == FinternetOnboarding
                ? "text-white"
                : "text-[${color}]"} `}>
            {React.string("Privacy Policy")}
          </div>
        </div>
      </div>
      <button
        className={`${flow == FinternetOnboarding
            ? `bg-white text-black`
            : `bg-[${color}] text-white`}  rounded-lg w-full h-12`}
        onClick={_ => onButtonPress()}>
        {React.string("Sign in with Finternet")}
      </button>
      <LinkToFinternetModal
        showModal={showModal}
        toggleModal={toggleModal}
        handleNavigate={handleNavigate}
        text="Link your Finternet account with the MyProp app"
        buttonText="Link"
      />
      <SecuredByFinterest color={color} />
    </div>
  </div>
}
