
Input
  = _WS? d:Document { return d; }

Document
  = Arrow
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
