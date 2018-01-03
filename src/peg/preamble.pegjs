
Input
  = _WS? d:Document { return d; }
/*
  = _WS? d:Document { return { term: 'document', value: d, location: location() }; }
*/

Document
  = Arrow
  / ConfigStateItems
  / ConfigStateItemList
  / StateDeclaration
  / SemVer
  / NonNegNumber
  / LicenseNotation
  / GraphLayout
  / GvizLayoutType
  / URL
  / MachineAttribute
  / Stripe
  / Cycle
  / MachineConfig
  / Shape
  / NamedColor
  / Color
