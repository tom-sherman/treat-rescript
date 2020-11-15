module Button = {
  @react.component
  let make = (~label) => <button className=AppStyles_treat.button> {React.string(label)} </button>
}

@react.component
let make = () => <Button label="Tom" />
