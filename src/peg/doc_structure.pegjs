
_LineTerminator
  = [\n\r\u2028\u2029]

_BlockCommentTail
  = "*/"
  / . _BlockCommentTail

_BlockComment "block comment"
  = "/*" _BlockCommentTail

_EOF
  = !.

_LineCommentTail
  = _LineTerminator
  / _EOF
  / . _LineCommentTail

_LineComment "line comment"
  = "//" _LineCommentTail

_WS "whitespace"
  = _BlockComment _WS? { return { term: 'whitespace', value: undefined, location: location() }; }
  / _LineComment  _WS? { return { term: 'whitespace', value: undefined, location: location() }; }
  / [ \t\r\n\v]+  _WS? { return { term: 'whitespace', value: undefined, location: location() }; }
