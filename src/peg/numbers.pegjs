
_HexDigit
  = [0-9a-fA-F]

_DecimalDigit
  = [0-9]

_NonZeroDigit
  = [1-9]

NonNegIntegerLiteral "integer literal"
  = "0"                          { return { term: 'Number', value: 0,                  location: location() }; }
  / _NonZeroDigit _DecimalDigit* { return { term: 'Number', value: parseFloat(text()), location: location() }; }

NonNegNumber "nonneg number"
  = NonNegIntegerLiteral "." _DecimalDigit* _WS? { return { term: 'Number', value: parseFloat(text()), location: location() }; }
  / NonNegIntegerLiteral                    _WS? { return { term: 'Number', value: parseFloat(text()), location: location() }; }
