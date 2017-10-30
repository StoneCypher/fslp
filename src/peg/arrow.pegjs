
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
