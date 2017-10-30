
_Char
  = _Unescaped
  / _Escape Sequence:(
        '"'
      / "\\"
      / "/"
      / "b" { return "\b"; }
      / "f" { return "\f"; }
      / "n" { return "\n"; }
      / "r" { return "\r"; }
      / "t" { return "\t"; }
      / "v" { return "\v"; }
      / "u" digits:$(_HexDigit _HexDigit _HexDigit _HexDigit) {
          return String.fromCharCode(parseInt(digits, 16));
        }
    )
    { return Sequence; }

_Escape    = "\\"
_QuoteMark = '"'
_Unescaped = [\x20-\x21\x23-\x5B\x5D-\u10FFFF]  // explicitly omits "

_ActionLabelChar
  = _ActionLabelUnescaped
  / _Escape Sequence:(
        "'"
      / "\\"
      / "/"
      / "b" { return "\b"; }
      / "f" { return "\f"; }
      / "n" { return "\n"; }
      / "r" { return "\r"; }
      / "t" { return "\t"; }
      / "v" { return "\v"; }
      / "u" digits:$(_HexDigit _HexDigit _HexDigit _HexDigit) {
          return String.fromCharCode(parseInt(digits, 16));
        }
    )
    { return Sequence; }

_ActionLabelQuoteMark = "'"
_ActionLabelUnescaped = [\x20-\x26\x28-\x5B\x5D-\u10FFFF]  // explicitly omits ' which is hex 27

_ActionLabel "action label"
  = _ActionLabelQuoteMark chars:_ActionLabelChar* _ActionLabelQuoteMark { return chars.join(""); }

_String "string"
  = _QuoteMark chars:_Char* _QuoteMark { return chars.join(""); }

_AtomFirstLetter
  = [0-9a-zA-Z\.\_\!\$\^\*\!\?\,\x80-\uFFFF]

_AtomLetter
  = [0-9a-zA-Z\.\+\=\_\^\(\)\*\&\$\#\@\!\?\,\x80-\uFFFF]

_Atom "atom"
  = firstletter:_AtomFirstLetter text:_AtomLetter* {
      return firstletter + ((text || []).join(''));
    }

_Label "label"
  = atom:_Atom
  / string:_String

_LabelList
  = "[" _WS? names:(_Label _WS?)* "]" { return names.map(i => i[0]); }

_LabelOrLabelList
  = _LabelList
  / _Label
