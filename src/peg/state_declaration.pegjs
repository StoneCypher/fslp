
StateDeclaration "state declaration"
  = name:_Label _WS? ":" _WS? value:ConfigStateItemList _WS? ";" _WS? {
  	return { term: 'state_declaration', name, value, location: location() };
  }
