open Treat

module Button = {
  @react.component
  let make = (~label) =>
    <button className={cxs([AppStyles_treat.buttonColor["red"], AppStyles_treat.button])}>
      {React.string(label)}
    </button>
}

@react.component
let make = () => <Button label="Tom" />
