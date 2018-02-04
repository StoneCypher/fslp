
// whargarbl todo make term 'library' if machine_name not present

Document
  = _WS? value:_Term* { return { term: 'fsl_parse_tree', value, location: location() }; }

_Term
  = Expr
  / StateDeclaration
  / NamedList
  / MachineAttribute
  / MachineConfig
