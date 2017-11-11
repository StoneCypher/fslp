
GvizLayoutType "gviz layout_type"
  = "dot"   { return { term: "layout_type", value: "dot",   location: location() }; }
  / "circo" { return { term: "layout_type", value: "circo", location: location() }; }
  / "fdp"   { return { term: "layout_type", value: "fdp",   location: location() }; }
  / "neato" { return { term: "layout_type", value: "neato", location: location() }; }

GraphLayout "graph layout"
  = "graph_layout" _WS? ":" _WS? value:GvizLayoutType _WS? ";" _WS? { return { term: "Graph Layout", value, location: location() }; }
