
GvizLayoutType "gviz layout type"
  = "dot"   { return { term: "Layout Type", value: "dot",   location: location() }; }
  / "circo" { return { term: "Layout Type", value: "circo", location: location() }; }
  / "fdp"   { return { term: "Layout Type", value: "fdp",   location: location() }; }
  / "neato" { return { term: "Layout Type", value: "neato", location: location() }; }

GraphLayout "graph layout"
  = "graph_layout" _WS? ":" _WS? value:GvizLayoutType _WS? ";" _WS? { return { term: "Graph Layout", value, location: location() }; }
