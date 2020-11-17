open TreatStyle
open MyTreat.Treat

let button = style(
  make(
    ~paddingLeft="10px",
    ~paddingRight="10px",
    ~paddingTop="15px",
    ~paddingBottom="15px",
    ~borderRadius="5px",
    ~boxSizing="border-box",
    (),
  ),
)

let buttonColor = styleMap({
  "blue": make(~color="blue", ()),
  "red": make(~color="red", ()),
})
