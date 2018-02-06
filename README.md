# fslp

Reference `fsl` parser in Typescripted Javascript, built on [pegjs](https://pegjs.org/).



## Purpose

This is intended to be a reference parser for `Finite State Language`, meaning that its results are definitive.  It is
entirely possible (even probable) that a more efficient system could be devised than `fslp` / `fslc`; such systems are
considered correct if-and-only-if their behavior matches the reference parser/compiler's exactly.

This is also the parser that underlies the `jssm` state machine as of version 6.