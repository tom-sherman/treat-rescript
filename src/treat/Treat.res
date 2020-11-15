// TODO: Use @bs.uncurry for themedStyle to avoid Curry runtime dependency
@bs.module("treat") external createTheme: 'theme => string = "createTheme"
@bs.module("treat") external style: TreatStyle.t => string = "style"
@bs.module("treat") external themedStyle: ('theme => TreatStyle.t) => string = "style"

type treatFns<'theme> = {
  theme: 'theme,
  style: TreatStyle.t => string,
  themedStyle: ('theme => TreatStyle.t) => string,
}

let makeTreat = theme => {
  theme: theme,
  style: style,
  themedStyle: themedStyle,
}
