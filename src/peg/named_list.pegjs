
NamedList
  = "&" _WS? name:Label _WS? ":" _WS? value:LabelOrLabelList _WS? ";" _WS? {
    return { term: 'named_list', name, value, location: location() };
  }
