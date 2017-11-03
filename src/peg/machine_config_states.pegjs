
_StateItemThingKey_Shape
  = "node_shape"

ConfigStateItemThings_Shape
  = value:_StateItemThingKey_Shape  { return { term: 'Shape', value, location: location() }; }





_StateItemThingKey_Color
  = "node_color"
  / "node_border_color"

ConfigStateItemThings_Color
  = _StateItemThingKey_Color






ConfigStateItemThings
  = ConfigStateItemThings_Shape
  / ConfigStateItemThings_Color





ConfigStateItems
  = value:ConfigStateItemThings { return { term: 'Config_StateItem', value, location: location() }; }
