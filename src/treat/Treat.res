// TODO: Use @bs.uncurry for themedStyle to avoid Curry runtime dependency
@bs.module("treat") external createTheme: 'theme => string = "createTheme"
@bs.module("treat") external style: TreatStyle.t => string = "style"
@bs.module("treat") external themedStyle: ('theme => TreatStyle.t) => string = "style"

module type Theme = {
  type t
}

module MakeTreat = (Theme: Theme) => {
  let themedStyle = (cb: Theme.t => TreatStyle.t) => themedStyle(cb)
  let style = style
}
