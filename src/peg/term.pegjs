
_Term
  = Expr
  / StateDeclaration
  / NamedList
  / MachineAttribute
  / MachineConfig

TermList
  = value:_Term* { return { term: 'termlist', value, location: location() }; }
