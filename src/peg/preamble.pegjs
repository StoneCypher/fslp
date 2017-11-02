
Input
  = _WS? d:Document { return d; }

Document
  = Arrow
  / Shape
  / NamedColor
  / Color
  / SemVer
  / NonNegNumber
  / LicenseNotation
  / GraphLayout
  / GvizLayoutType
  / URL
  / MachineAttribute
  / Stripe
  / Cycle
