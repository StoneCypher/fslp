
_TransitionKey_HeadType
  = "arrow_head"
  / "reverse_arrow_head"


ConfigTransitionItem_Head
  = transitionkey:_TransitionKey_HeadType _WS? ":" _WS? value:ArrowHead _WS? ";" _WS? {
    return { key: transitionkey, value, location: location() };
  }





_TransitionKey_Color
  = "edge_color"
  / "reverse_edge_color"


ConfigTransitionItem_Color
  = transitionkey:_TransitionKey_Color _WS? ":" _WS? value:Color _WS? ";" _WS? {
    return { key: transitionkey, value, location: location() };
  }





ConfigTransitionItems
  = ConfigTransitionItem_Color
  / ConfigTransitionItem_Head
