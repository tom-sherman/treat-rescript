module type Theme = {
  type t
}

module MakeTreat = (Theme: Theme) => {
  @bs.module("treat") external createTheme: Theme.t => string = "createTheme"

  @bs.module("treat") external style: TreatStyle.t => string = "style"

  @bs.module("treat")
  external themedStyle: (@bs.uncurry (Theme.t => TreatStyle.t)) => string = "style"
}
