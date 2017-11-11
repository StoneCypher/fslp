
NamedList
  = WS? "&" WS? list_name:Label WS? ":" WS? contents:LabelOrLabelList WS? ";" WS? {
    return { key:'named_list', name:list_name, value:contents };
  }
