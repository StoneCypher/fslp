
ArrowItemKey
  = "arc_label"
  / "head_label"
  / "tail_label"

ArrowItem
  = term:ArrowItemKey _WS? ":" _WS? value:_Label _WS? ";" _WS? { return { term, value }; }

SingleEdgeColor "single edge color"
  = _WS? "edge_color" _WS? ":" _WS? value:Color _WS? ";" _WS? { return {key:'single_edge_color', value:value}; }

ArrowItems
  = SingleEdgeColor
  / ArrowItem+

ArrowDesc
  = "{" _WS? items:ArrowItems? _WS? "}" { return items; }

ArrowProbability
  = value:NonNegNumber "%" { return { key: 'arrow probability', value: value }; }



ArrowTarget
  = Stripe
  / Cycle
  / _LabelList
  / _Label
