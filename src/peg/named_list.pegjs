
NamedList
  = "&" _WS? name:_Label _WS? ":" _WS? value:_LabelOrLabelList _WS? ";" _WS? {
    return {
    	term: 'named_list',
    	name,
    	value,
    	location: location()
    };
  }
