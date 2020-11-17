module type Theme = {
  type t
}

module MakeTreat = (Theme: Theme) => {
  @bs.module("treat") external createTheme: Theme.t => TreatStyle.t = "createTheme"

  @bs.module("treat") external style: TreatStyle.t => TreatStyle.t = "style"

  @bs.module("treat")
  external themedStyle: (@bs.uncurry (Theme.t => TreatStyle.t)) => TreatStyle.t = "style"

  // TODO: Proper binding/API or remove the need for it as described in https://github.com/seek-oss/treat/issues/142
  // We are returning the same type because styleMap is expected to be passed a record with TreatStyle.t values, passing anything else should be an error.
  // This is the whole reason for TreatStyle.t being a string.
  @bs.module("treat") external styleMap: 'a => 'a = "styleMap"
}

// This does nothing right now (is an identity fn), but it's introduced because i'm pretty sure it will be needed in the API later.
let cx = (ref: TreatStyle.t) => ref
let cxs = (xs: array<TreatStyle.t>) => {
  open Belt.Set.String
  // Pipe through a SetString to dedupe classnames
  xs->fromArray->toArray |> Js.Array.joinWith(" ")
}
