type theme = {primaryColor: string}

let greenTheme = Treat.createTheme({
  primaryColor: "green",
})
let blueTheme = Treat.createTheme({
  primaryColor: "blue",
})

// Pass in an example theme value to `makeTreat` properly type your treat instance
let {Treat.style: style, themedStyle} = Treat.makeTreat(greenTheme)
