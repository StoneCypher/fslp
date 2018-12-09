# fslp

Reference `fsl` parser in Typescripted Javascript, built on [pegjs](https://pegjs.org/).

If you're looking to run finite state machines in practice, you probably want [jssm](https://github.com/StoneCypher/jssm) instead.  This is a reference language parser.



## Purpose

This is intended to be a reference parser for `Finite State Language`, meaning that its results are definitive.  It is
entirely possible (even probable) that a more efficient system could be devised than `fslp` / `fslc`; such systems are
considered correct if-and-only-if their behavior matches the reference parser/compiler's exactly.

This is also the parser that underlies the `jssm` state machine as of version 6.



## About state machine rendering

State machines can get complex, and when they do, like any other code, they can get a bit difficult to understand.  In order to help sort out how a state machine works, FSL provides a library that hooks up [graphviz]() by way of [viz.js]() to provide flowchart-style renderings of the machines, to help make them more understandable.  Graphviz is remarkably good at providing meaningful charts with little guidance (and is fairly obviously in part the inspiration for the FSL language.)

FSL also provides a [graph explorer](https://stonecypher.github.io/jssm-viz-demo/graph_explorer.html) that lets you write machines with constant visual feedback on their emergent structure (which can also be very helpful in understanding other peoples' machines, and in finding defects.)

If you are learning the language, it is ***highly encouraged*** that you keep `graph explorer` or another similar tool open, so that you can experiment while you learn.  

This is probably not the best document to learn from.  There is a [draft tutorial](https://stonecypher.github.io/fsl/draft%20tutorial) to read instead.  This document is mostly meant for implementors, and does not discuss reasons or motivations.



# Language as parsed

These are the current language features in the language design.  The parser will hit 1.0 when it supports all of them.  Nearly all of these features are already implemented in the prior-generation parser in [jssm](https://github.com/StoneCypher/jssm).



## The language basics and terminology.

* `Machine`
  * A `machine` is a design.  
  * A complete piece of code describes a `machine`.  
  * "A three color traffic signal" is a `machine`.

* `Instance`
  * An `instance` is a single case of a `machine`.  
  * An `instance` is a `machine` plus a `state`, possibly `data`, and possibly `hooks`.  
  * "The three color signal at 5th and brady" is an `instance`.
  
* `State`
  * A `state` is what a current `instance` is set to.
    * `Instance`s have a `state`.  `Machine`s do not.  
      * The color traffic signals in general don't have a color.  
      * The three color signal at 5th and brady, however, does.
  * In this language, `state`s are strings.
    * The concept of a state machine does not require this.
    * An implementation could easily use integers under the hood, for efficiency.  States are not dynamic.



## Validity and well formedness

A file is a valid `FSL` state machine if:

1. It has at least one transition
1. It does not contain parsing errors

A file is a well formed `FSL` state machine if:

1. It has either a `machine_name` header or a `library_name` header
1. It is under the file extension `.fsl`

The search facilities offered by the FSL page will only reveal well-formed FSL state machines.  The language will parse any valid state machine.



## Transitions

Transitions are, in essence, the bread and butter of a state machine.  Without them, one just has a collection of labels.  They also tend to be the bulk of the description of a non-trivial machine.

As such, transitions are most of the language.



### Arrow direction

The most common notation for transitions are arrows, pointing left, right, or both directions between two states.  That direction is enforced in a transition.

Arrow direction tells the machine which directions are permitted.  The machine will resist any transition that hasn't been explicitly allowed.

So by example, a light switch may go freely between on and off:

```fsl
On <-> Off;
```

However, one does not return from death.

```fsl
Alive -> Dead;
```

<img height="140" src="src/site/assets/on_off%20and%20alive_dead.png"/>

These are both valid, complete state machines.  They can be executed, and rendered (as above.)

Each of these state machines has two `state`s.  By example, the light switch has the state `On` and the state `Off`.

The on/off state machine has ***two*** transitions (that arrow draws one in each direction, not one that goes both directions; this difference can be important when attaching events.)  By contrast, the survival machine has only one transition.

Notice that [graph explorer](https://stonecypher.github.io/jssm-viz-demo/graph_explorer.html) has colored the `Dead` state red.  That's because the state is "terminal" - that machine cannot make any changes once it has reached that state.  There is no escape from being `Dead`.



### Arrow chaining

Because states are often successive, it can be a time saver to chain arrows: `Infant -> Child -> Adult -> Senior;`

This is also a convenient way to write loops: `Spring -> Summer -> Autumn -> Winter -> Spring;`

Chains do not need to be unidirectional: `solid -> liquid <-> gas <- plasma;`



### Transition kind

Arrows also determine the `transition kind`.  Something may be a `main transition`, a `legal transition`, or a `forced transition`.

The arrows above are legal transitions.  However, if you tell your machine more, it can do a better job in rendering, in statistics gathering, and in protecting you from mistakes.

Also, code written with sparing use of main transitions can help a reader understand what is meant to be the primary path of the machine.  When you consider all the side jobs an ATM has to do, this can actually be quite important for a reader with no context.

#### Legal transitions

Most transitions will be `legal transitions`.

`Legal transitions` are written with a hyphen: 

```fsl
Thing -> OtherThing;
```

#### Main transitions

A few transitions should be `main transitions`, which tell the machine which transitions to expect as the primary course for an `instance`.

We will also write these state names with quotation marks, to let us use spaces.

`Main transitions` are written with an equals sign:

```fsl
"Primary Thing" => "Other Major Stuff";
```

#### Forced transitions

If there's a thing that an `instance` generally should not do, write it with a `forced transition`.  They're called `forced transitions` because, much like with the `-f` flag on formatting a disk, you must force the machine to follow them; otherwise it will say no.  `Forced transitions` are meant to model things that are generally the wrong thing to do, or are destructive when used, such as destroying an asset, deleting an account.

`Forced transitions` are written with a tilde.

```fsl
"Normal Operation" ~> "Self Destruct".
```


### Target lists

Now, in the above example, presumably the implied spaceship would have other states, such as **Docked**, **"Red Alert"**, and **Quarantine**. Writing out giant repetitive lists of transitions is tedious and error prone, so we offer `target lists`.

```
["Normal Operation" Landed Docked "Red Alert" Quarantine Flag Capital Escort Dark Scuttled] ~> "Self Destruct".
```

This explicitly writes that all of those states may be forced-transitioned to **"Self Destruct"**.



### Cycles

A denser notation for loops is `cycle`s, and `cycle`s come with some advantages.  They are arguably slightly less readable, but, attributes attached to an edge are attached to all edges in the cycle.



## States

States (and their enforcement) are most of what a typical user gets from a state machine.
