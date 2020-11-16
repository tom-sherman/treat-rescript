> **NOTE: This is a work in progress**

# Statically extracted CSS for ReScript (and ReasonML!)

Here are the headline features:

- Full static extraction
- Type safe
- Minimal runtime
- Legacy browser support

## How?

Treat is the amazing CSS-in-JS technology that powers the Braid design system. It was originally designed with TypeScript in mind, it's constraints and solutions lend themselves perfectly to ReScript applications. You can read more details on the Treat website about these constraints.

We can very easily add ReScript bindings to Treat's tiny API to hopefully solve all of our CSS woes.

## Show me the code already!

You write your styles in treat files, they have a special file name format so that the compiler knows where to look.

If you've worked woth CSS modules, this will be very familiar to you. Except of writing CSS, you can leverage the full power of ReScript! 

```rescript
// AppStyles_treat.res

open TreatStyle
open MyTreat

let button = style(
  make(
    ~backgroundColor="blue",
    ~paddingLeft="10px",
    ~paddingRight="10px",
    ~paddingTop="15px",
    ~paddingBottom="15px",
    ~borderRadius="5px",
    ~boxSizing="5px",
    (),
  ),
)
```

Every time you call the `style` function, some static CSS will be added to your bundle and it will return a generated class name. Treat is themed, and this is possible in ReScript too. Notice the `open MyTreat.Treat` line? In there we have created our own treat module by passing `MakeTreat` our theme.

```rescript
// MyTreat.res

module MyTheme = {
  type t = {small: string}
}

module Treat = Treat.MakeTreat(MyTheme)
```

Now, in your React code, you can use the generated class name to apply the styles.

```rescript
// App.res

module Button = {
  @react.component
  let make = (~label) => <button className=AppStyles_treat.button> {React.string(label)} </button>
}
```

## Behind the curtain

For this to work, you'll need some bindings (`style`, `themedStyle`, `styleMap`...) to the treat API, as well as some helpers to declare your styles in idiomatical ReScript. You can find these on the proof-of-concept repository on GitHub.
