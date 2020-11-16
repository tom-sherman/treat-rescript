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
    ~paddingLeft="10px",
    ~paddingRight="10px",
    ~paddingTop="15px",
    ~paddingBottom="15px",
    ~borderRadius="5px",
    ~boxSizing="5px",
    (),
  ),
)

let buttonColor = themedStyle(theme => make(~backgroundColor=theme.buttonColor, ()))
```

Every time you call the `style` function, some static CSS will be added to your bundle and it will return a generated class name. Treat is themed, and this is possible in ReScript too. This is written in `AppStyles_treat.res` so that we can tell the treat webpack plugin to look for files ending in "_treat.bs.js"

Notice the `open MyTreat.Treat` line? In there we have created our own treat module by passing `MakeTreat` our theme.

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

## Further work

These are sorted in pretty much priority order 

- A complete, idiomatic API
- Allow install as a dependency
- Property escape hatch: https://reasonml.github.io/reason-react/docs/en/style#escape-hatch-unsafeaddprop
- Support for non-string properties?
- ppx to transform `style({ color: "blue", fontSize: "12px" })` -> `style(~color="blue", ~fontSize: "12px", ())` like in cem2ran/style-ppx. Potentially depend on https://github.com/odis-labs/ppx_obj_make or just include an example of how to set it up.
- ppx to allow for style modules in the same file as a component, or multiple modules in the same file. Extract the module to it's own file at compile time.

## Prior art

- https://github.com/cem2ran/style-ppx
- https://github.com/davesnx/styled-ppx
