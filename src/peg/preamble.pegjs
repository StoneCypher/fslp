
Input
  = _WS? d:Document { return d; }
/*
  = _WS? value:Document {
  	return {
  		term     : 'document',
  		value,
  		location : location()
  	};
  }
*/

Document
  = TermList
/*
  / Arrow
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
*/