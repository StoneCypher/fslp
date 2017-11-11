
ArrowItemKey
  = "arc_label"
  / "head_label"
  / "tail_label"

ArrowItem
  = term:ArrowItemKey _WS? ":" _WS? value:_Label _WS? ";" _WS? {
    return { term, value, location: location() };
  }

SingleEdgeColor "single edge color"
  = "edge_color" _WS? ":" _WS? value:Color _WS? ";" _WS? {
    return { term: 'single_edge_color', value, location: location() };
  }

ArrowItems
  = SingleEdgeColor
  / ArrowItem+

ArrowDesc
  = "{" _WS? items:ArrowItems? _WS? "}" { return items; }

ArrowProbability
  = value:NonNegNumber "%" {
    return { term: 'arrow_probability', value, location: location() };
  }



ArrowTarget
  = Stripe
  / Cycle
  / _LabelList
  / _Label
