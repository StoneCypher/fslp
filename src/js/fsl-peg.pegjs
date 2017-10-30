
Document
  = Arrow
  / Shape


Arrow "arrow"
  = MixedArrow / LightArrow / FatArrow / TildeArrow





ForwardLightArrow "forward light arrow ->"
  = "->"  { return { term: "arrow", location: location(), value: "->" };  }
  / "→"   { return { term: "arrow", location: location(), value: "->" };  }

TwoWayLightArrow "two way light arrow <->"
  = "<->" { return { term: "arrow", location: location(), value: "<->" }; }
  / "↔"   { return { term: "arrow", location: location(), value: "<->" }; }

BackLightArrow "back light arrow <-"
  = "<-"  { return { term: "arrow", location: location(), value: "<-" };  }
  / "←"   { return { term: "arrow", location: location(), value: "<-" };  }



ForwardFatArrow "forward fat arrow =>"
  = "=>"  { return { term: "arrow", location: location(), value: "=>" };  }
  / "⇒"   { return { term: "arrow", location: location(), value: "=>" };  }

TwoWayFatArrow "two way fat arrow <=>"
  = "<=>" { return { term: "arrow", location: location(), value: "<=>" }; }
  / "⇔"   { return { term: "arrow", location: location(), value: "<=>" }; }

BackFatArrow "back fat arrow <="
  = "<="  { return { term: "arrow", location: location(), value: "<=" };  }
  / "⇐"   { return { term: "arrow", location: location(), value: "<=" };  }



ForwardTildeArrow "forward tilde arrow ~>"
  = "~>"  { return { term: "arrow", location: location(), value: "~>" };  }
  / "↛"   { return { term: "arrow", location: location(), value: "~>" };  }

TwoWayTildeArrow "two way tilde arrow <~>"
  = "<~>" { return { term: "arrow", location: location(), value: "<~>" }; }
  / "↮"   { return { term: "arrow", location: location(), value: "<~>" }; }

BackTildeArrow "back tilde arrow <~"
  = "<~"  { return { term: "arrow", location: location(), value: "<~" };  }
  / "↚"   { return { term: "arrow", location: location(), value: "<~" };  }




LightFatArrow "light fat arrow <-=>"
  = "<-=>" { return { term: "arrow", location: location(), value: "<-=>" }; }
  / "<-⇒"  { return { term: "arrow", location: location(), value: "<-=>" }; }
  / "←=>"  { return { term: "arrow", location: location(), value: "<-=>" }; }
  / "←⇒"   { return { term: "arrow", location: location(), value: "<-=>" }; }

LightTildeArrow "light tilde arrow <-~>"
  = "<-~>" { return { term: "arrow", location: location(), value: "<-~>" }; }
  / "←~>"  { return { term: "arrow", location: location(), value: "<-~>" }; }
  / "<-↛"  { return { term: "arrow", location: location(), value: "<-~>" }; }
  / "←↛"   { return { term: "arrow", location: location(), value: "<-~>" }; }

FatLightArrow "fat light arrow <=->"
  = "<=->" { return { term: "arrow", location: location(), value: "<=->" }; }
  / "⇐->"  { return { term: "arrow", location: location(), value: "<=->" }; }
  / "<=→"  { return { term: "arrow", location: location(), value: "<=->" }; }
  / "⇐→"   { return { term: "arrow", location: location(), value: "<=->" }; }

FatTildeArrow "fat tilde arrow <=~>"
  = "<=~>" { return { term: "arrow", location: location(), value: "<=~>" }; }
  / "⇐~>"  { return { term: "arrow", location: location(), value: "<=~>" }; }
  / "<=↛"  { return { term: "arrow", location: location(), value: "<=~>" }; }
  / "⇐↛"   { return { term: "arrow", location: location(), value: "<=~>" }; }

TildeLightArrow "tilde light arrow <~->"
  = "<~->" { return { term: "arrow", location: location(), value: "<~->" }; }
  / "↚->"  { return { term: "arrow", location: location(), value: "<~->" }; }
  / "<~→"  { return { term: "arrow", location: location(), value: "<~->" }; }
  / "↚→"   { return { term: "arrow", location: location(), value: "<~->" }; }

TildeFatArrow "tilde fat arrow <~=>"
  = "<~=>" { return { term: "arrow", location: location(), value: "<~=>" }; }
  / "↚=>"  { return { term: "arrow", location: location(), value: "<~=>" }; }
  / "<~⇒"  { return { term: "arrow", location: location(), value: "<~=>" }; }
  / "↚⇒"   { return { term: "arrow", location: location(), value: "<~=>" }; }





LightArrow "light arrow"
  = ForwardLightArrow / TwoWayLightArrow / BackLightArrow

FatArrow "fat arrow"
  = ForwardFatArrow / TwoWayFatArrow / BackFatArrow

TildeArrow "tilde arrow"
  = ForwardTildeArrow / TwoWayTildeArrow / BackTildeArrow

MixedArrow "mixed arrow"
  = LightFatArrow / LightTildeArrow / FatLightArrow / FatTildeArrow / TildeLightArrow / TildeFatArrow


Shape
 = "box"             { return { term: 'Shape', value: 'box',             location: location() }; }
 / "polygon"         { return { term: 'Shape', value: 'polygon',         location: location() }; }
 / "ellipse"         { return { term: 'Shape', value: 'ellipse',         location: location() }; }
 / "oval"            { return { term: 'Shape', value: 'oval',            location: location() }; }
 / "circle"          { return { term: 'Shape', value: 'circle',          location: location() }; }
 / "point"           { return { term: 'Shape', value: 'point',           location: location() }; }
 / "egg"             { return { term: 'Shape', value: 'egg',             location: location() }; }
 / "triangle"        { return { term: 'Shape', value: 'triangle',        location: location() }; }
 / "plaintext"       { return { term: 'Shape', value: 'plaintext',       location: location() }; }
 / "plain"           { return { term: 'Shape', value: 'plain',           location: location() }; }
 / "diamond"         { return { term: 'Shape', value: 'diamond',         location: location() }; }
 / "trapezium"       { return { term: 'Shape', value: 'trapezium',       location: location() }; }
 / "parallelogram"   { return { term: 'Shape', value: 'parallelogram',   location: location() }; }
 / "house"           { return { term: 'Shape', value: 'house',           location: location() }; }
 / "pentagon"        { return { term: 'Shape', value: 'pentagon',        location: location() }; }
 / "hexagon"         { return { term: 'Shape', value: 'hexagon',         location: location() }; }
 / "septagon"        { return { term: 'Shape', value: 'septagon',        location: location() }; }
 / "octagon"         { return { term: 'Shape', value: 'octagon',         location: location() }; }
 / "doublecircle"    { return { term: 'Shape', value: 'doublecircle',    location: location() }; }
 / "doubleoctagon"   { return { term: 'Shape', value: 'doubleoctagon',   location: location() }; }
 / "tripleoctagon"   { return { term: 'Shape', value: 'tripleoctagon',   location: location() }; }
 / "invtriangle"     { return { term: 'Shape', value: 'invtriangle',     location: location() }; }
 / "invtrapezium"    { return { term: 'Shape', value: 'invtrapezium',    location: location() }; }
 / "invhouse"        { return { term: 'Shape', value: 'invhouse',        location: location() }; }
 / "Mdiamond"        { return { term: 'Shape', value: 'Mdiamond',        location: location() }; }
 / "Msquare"         { return { term: 'Shape', value: 'Msquare',         location: location() }; }
 / "Mcircle"         { return { term: 'Shape', value: 'Mcircle',         location: location() }; }
 / "rect"            { return { term: 'Shape', value: 'rect',            location: location() }; }
 / "rectangle"       { return { term: 'Shape', value: 'rectangle',       location: location() }; }
 / "square"          { return { term: 'Shape', value: 'square',          location: location() }; }
 / "star"            { return { term: 'Shape', value: 'star',            location: location() }; }
 / "none"            { return { term: 'Shape', value: 'none',            location: location() }; }
 / "underline"       { return { term: 'Shape', value: 'underline',       location: location() }; }
 / "cylinder"        { return { term: 'Shape', value: 'cylinder',        location: location() }; }
 / "note"            { return { term: 'Shape', value: 'note',            location: location() }; }
 / "tab"             { return { term: 'Shape', value: 'tab',             location: location() }; }
 / "folder"          { return { term: 'Shape', value: 'folder',          location: location() }; }
 / "box3d"           { return { term: 'Shape', value: 'box3d',           location: location() }; }
 / "component"       { return { term: 'Shape', value: 'component',       location: location() }; }
 / "promoter"        { return { term: 'Shape', value: 'promoter',        location: location() }; }
 / "cds"             { return { term: 'Shape', value: 'cds',             location: location() }; }
 / "terminator"      { return { term: 'Shape', value: 'terminator',      location: location() }; }
 / "utr"             { return { term: 'Shape', value: 'utr',             location: location() }; }
 / "primersite"      { return { term: 'Shape', value: 'primersite',      location: location() }; }
 / "restrictionsite" { return { term: 'Shape', value: 'restrictionsite', location: location() }; }
 / "fivepoverhang"   { return { term: 'Shape', value: 'fivepoverhang',   location: location() }; }
 / "threepoverhang"  { return { term: 'Shape', value: 'threepoverhang',  location: location() }; }
 / "noverhang"       { return { term: 'Shape', value: 'noverhang',       location: location() }; }
 / "assembly"        { return { term: 'Shape', value: 'assembly',        location: location() }; }
 / "signature"       { return { term: 'Shape', value: 'signature',       location: location() }; }
 / "insulator"       { return { term: 'Shape', value: 'insulator',       location: location() }; }
 / "ribosite"        { return { term: 'Shape', value: 'ribosite',        location: location() }; }
 / "rnastab"         { return { term: 'Shape', value: 'rnastab',         location: location() }; }
 / "proteasesite"    { return { term: 'Shape', value: 'proteasesite',    location: location() }; }
 / "proteinstab"     { return { term: 'Shape', value: 'proteinstab',     location: location() }; }
 / "rpromoter"       { return { term: 'Shape', value: 'rpromoter',       location: location() }; }
 / "rarrow"          { return { term: 'Shape', value: 'rarrow',          location: location() }; }
 / "larrow"          { return { term: 'Shape', value: 'larrow',          location: location() }; }
 / "lpromoter"       { return { term: 'Shape', value: 'lpromoter',       location: location() }; }
 / "record"          { return { term: 'Shape', value: 'record',          location: location() }; }
