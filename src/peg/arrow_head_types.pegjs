
_ArrowHeadList
 = "box"       / "lbox"       / "rbox"       / "obox"      / "olbox"     / "orbox"
 / "crow"      / "lcrow"      / "rcrow"      / "diamond"   / "ldiamond"  / "rdiamond"
 / "odiamond"  / "oldiamond"  / "ordiamond"  / "dot"       / "odot"      / "inv"
 / "linv"      / "rinv"       / "oinv"       / "olinv"     / "orinv"     / "none"
 / "normal"    / "lnormal"    / "rnormal"    / "onormal"   / "olnormal"  / "ornormal"
 / "tee"       / "ltee"       / "rtee"       / "vee"       / "lvee"      / "rvee"
 / "curve"     / "lcurve"     / "rcurve"     / "icurve"    / "licurve"   / "ricurve"





ArrowHead "shape"
 = value:_ArrowHeadList { return { term: 'arrow_head', value, location: location() }; }

ReverseArrowHead "shape"
 = value:_ArrowHeadList { return { term: 'arrow_tail', value, location: location() }; }
