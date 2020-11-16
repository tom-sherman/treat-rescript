module MyTheme = {
  type t = {small: string}
}

module Treat = Treat.MakeTreat(MyTheme)
