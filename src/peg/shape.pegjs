
_ShapeList
  = "box"           / "polygon"       / "ellipse"         / "oval"          / "circle"         / "point"
  / "egg"           / "triangle"      / "plaintext"       / "plain"         / "diamond"        / "trapezium"
  / "parallelogram" / "house"         / "pentagon"        / "hexagon"       / "septagon"       / "octagon"
  / "doublecircle"  / "doubleoctagon" / "tripleoctagon"   / "invtriangle"   / "invtrapezium"   / "invhouse"
  / "Mdiamond"      / "Msquare"       / "Mcircle"         / "rect"          / "rectangle"      / "square"
  / "star"          / "none"          / "underline"       / "cylinder"      / "note"           / "tab"
  / "folder"        / "box3d"         / "component"       / "promoter"      / "cds"            / "terminator"
  / "utr"           / "primersite"    / "restrictionsite" / "fivepoverhang" / "threepoverhang" / "noverhang"
  / "assembly"      / "signature"     / "insulator"       / "ribosite"      / "rnastab"        / "proteasesite"
  / "proteinstab"   / "rpromoter"     / "rarrow"          / "larrow"        / "lpromoter"      / "record"

Shape "shape"
 = value:_ShapeList { return { term: 'Shape', value, location: location() }; }
