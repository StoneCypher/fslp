
_StateItemThingKey_Shape
  = "node_shape"

ConfigStateItemThings_Shape
/* todo value is missing whargarbl */
  = term:_StateItemThingKey_Shape _WS? {
  	return { term, value, location: location() };
  }





_StateItemThingKey_Color
  = "node_color"
  / "node_border_color"

ConfigStateItemThings_Color
  = _StateItemThingKey_Color






ConfigStateItemThings
  = ConfigStateItemThings_Shape
  / ConfigStateItemThings_Color





ConfigStateItems
/* todo this value structure is wrong whargarbl */
  = term:ConfigStateItemThings _WS? ":" _WS? value:_Label _WS? { return { term, value, location: location() }; }
