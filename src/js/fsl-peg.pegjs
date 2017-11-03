
{

  // used in cycles and stripes
  function signflip({ term, value, location }) {
    return { term, value: value * -1, location };
  }

}


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


LabelOrListMachineAttributes
  = "machine_author"
  / "machine_contributor"
  / "machine_comment"
  / "machine_reference"

MachineAttribute_LabelOrList
  = term:LabelOrListMachineAttributes _WS? ":" _WS? value:_LabelOrLabelList _WS? ";" _WS? {
    return { term, value, location: location() };
  }





LabelMachineAttributes
  = "machine_name"
  / "machine_language"     // todo this is wrong, this should be 639-2 or whatever it is

MachineAttribute_Label
  = term:LabelMachineAttributes _WS? ":" _WS? value:_Label _WS? ";" _WS? {
    return { term, value, location: location() };
  }





SemverMachineAttributes
  = "machine_version"
  / "fsl_version"

MachineAttribute_Semver
  = term:SemverMachineAttributes _WS? ":" _WS? value:SemVer _WS? ";" _WS? {
    return { term, value, location: location() };
  }





MachineDefinition
  = "machine_definition" _WS? ":" _WS? definition:URL _WS? ";" _WS? {
    return { term: "machine_definition", value: definition, location: location() };
  }


MachineLicense
  = "machine_license" _WS? ":" _WS? license:LicenseNotation _WS? ";" _WS? {
    return { term: "machine_license", value: license, location: location() };
  }





MachineAttribute "machine attribute"
  = MachineDefinition
  / MachineLicense
  / MachineAttribute_LabelOrList
  / MachineAttribute_Label
  / MachineAttribute_Semver


// todo whargarbl these subexpr terms are currently ordered, and that's stupid
// change this to be unordered

Subexpr
  = _WS? r_action : _ActionLabel?
    _WS? r_prob   :  ArrowProbability?
    _WS? l_desc   :  ArrowDesc?
    _WS? arrow    :  Arrow
    _WS? r_desc   :  ArrowDesc?
    _WS? l_prob   :  ArrowProbability?
    _WS? l_action : _ActionLabel?
    _WS? label    :  ArrowTarget
    _WS? tail     :  Subexpr? {

      // this changed kind to key.  some breakage may result?
      const base = { key: arrow, to: label };

      if (tail && (tail !== [])) { base.se            = tail;         }
      if (l_desc)                { base.l_desc        = l_desc;       }
      if (r_desc)                { base.r_desc        = r_desc;       }
      if (l_action)              { base.l_action      = l_action;     }
      if (r_action)              { base.r_action      = r_action;     }
      if (l_prob)                { base.l_probability = l_prob.value; }
      if (r_prob)                { base.r_probability = r_prob.value; }

      return base;

    }



Expr
  = label:ArrowTarget se:Subexpr _WS? ';' _WS? {
    return { key: 'transition', from: label, se: (se && (se !== []))? se : undefined };
  }


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
  = _BlockComment _WS? { return { term: 'Whitespace', value: undefined, location: location() }; }
  / _LineComment  _WS? { return { term: 'Whitespace', value: undefined, location: location() }; }
  / [ \t\r\n\v]+  _WS? { return { term: 'Whitespace', value: undefined, location: location() }; }


_UrlProtocol
  = 'hsts://'
  / 'http://'
  / 'https://'

URL "url"
  = protocol:_UrlProtocol [a-zA-Z0-9\!\*\'\(\)\:\;\@\&\=\+\$\,\/\?\#\[\]\_\.\~\-]+ { return { term: "URL", value: text(), location: location() }; }


GvizLayoutType "gviz layout type"
  = "dot"   { return { term: "Layout Type", value: "dot",   location: location() }; }
  / "circo" { return { term: "Layout Type", value: "circo", location: location() }; }
  / "fdp"   { return { term: "Layout Type", value: "fdp",   location: location() }; }
  / "neato" { return { term: "Layout Type", value: "neato", location: location() }; }

GraphLayout "graph layout"
  = "graph_layout" _WS? ":" _WS? value:GvizLayoutType _WS? ";" _WS? { return { term: "Graph Layout", value, location: location() }; }


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


LicenseNotation "license"
  = 'MIT'                    { return { term: 'License', value: 'MIT',           known: true,  viral: false,     location: location() }; }
  / 'BSD 2-clause'           { return { term: 'License', value: 'BSD 2-clause',  known: true,  viral: false,     location: location() }; }
  / 'BSD 3-clause'           { return { term: 'License', value: 'BSD 3-clause',  known: true,  viral: false,     location: location() }; }
  / 'Apache 2.0'             { return { term: 'License', value: 'Apache 2.0',    known: true,  viral: false,     location: location() }; }
  / 'Mozilla 2.0'            { return { term: 'License', value: 'Mozilla 2.0',   known: true,  viral: false,     location: location() }; }
  / 'Public domain'          { return { term: 'License', value: 'Public domain', known: true,  viral: false,     location: location() }; }
  / 'GPL v2'                 { return { term: 'License', value: 'GPL v2',        known: true,  viral: true,      location: location() }; }
  / 'GPL v3'                 { return { term: 'License', value: 'GPV v3',        known: true,  viral: true,      location: location() }; }
  / 'LGPL v2.1'              { return { term: 'License', value: 'LGPL v2.1',     known: true,  viral: true,      location: location() }; }
  / 'LGPL v3.0'              { return { term: 'License', value: 'LGPL v3.0',     known: true,  viral: true,      location: location() }; }
  / 'Unknown license'        { return { term: 'License', value: undefined,       known: false, viral: undefined, location: location() }; }
  / 'License ' custom:_Label { return { term: 'License', value: custom,          known: true,  viral: undefined, location: location() }; }


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


SemVer
  = major:NonNegIntegerLiteral "." minor:NonNegIntegerLiteral "." patch:NonNegIntegerLiteral
  {
    const pmajor = parseInt(major.value, 10),
          pminor = parseInt(minor.value, 10),
          ppatch = parseInt(patch.value, 10);

    return {
      term   : 'SemVer',

      major  : pmajor,
      minor  : pminor,
      patch  : ppatch,

      parsed : [pmajor, pminor, ppatch],

      value  : text()
    };
  }

_SemVerOper
  = "^"
  / "~"
  / ">="
  / "<="
  / "<"
  / ">"

_SemVerRule
  = _SemVerOper? SemVer

_SemVerRange
  = _SemVerRule _SemVerRule?


NamedColor "named color"
  = 'aliceblue'            { return { term: 'Color', value: 'f0f8ffff', location: location() }; }
  / 'AliceBlue'            { return { term: 'Color', value: 'f0f8ffff', location: location() }; }
  / 'antiquewhite'         { return { term: 'Color', value: 'faebd7ff', location: location() }; }
  / 'AntiqueWhite'         { return { term: 'Color', value: 'faebd7ff', location: location() }; }
  / 'aqua'                 { return { term: 'Color', value: '00ffffff', location: location() }; }
  / 'Aqua'                 { return { term: 'Color', value: '00ffffff', location: location() }; }
  / 'aquamarine'           { return { term: 'Color', value: '7fffd4ff', location: location() }; }
  / 'Aquamarine'           { return { term: 'Color', value: '7fffd4ff', location: location() }; }
  / 'azure'                { return { term: 'Color', value: 'f0ffffff', location: location() }; }
  / 'Azure'                { return { term: 'Color', value: 'f0ffffff', location: location() }; }
  / 'beige'                { return { term: 'Color', value: 'f5f5dcff', location: location() }; }
  / 'Beige'                { return { term: 'Color', value: 'f5f5dcff', location: location() }; }
  / 'bisque'               { return { term: 'Color', value: 'ffe4c4ff', location: location() }; }
  / 'Bisque'               { return { term: 'Color', value: 'ffe4c4ff', location: location() }; }
  / 'black'                { return { term: 'Color', value: '000000ff', location: location() }; }
  / 'Black'                { return { term: 'Color', value: '000000ff', location: location() }; }
  / 'blanchedalmond'       { return { term: 'Color', value: 'ffebcdff', location: location() }; }
  / 'BlanchedAlmond'       { return { term: 'Color', value: 'ffebcdff', location: location() }; }
  / 'blue'                 { return { term: 'Color', value: '0000ffff', location: location() }; }
  / 'Blue'                 { return { term: 'Color', value: '0000ffff', location: location() }; }
  / 'blueviolet'           { return { term: 'Color', value: '8a2be2ff', location: location() }; }
  / 'BlueViolet'           { return { term: 'Color', value: '8a2be2ff', location: location() }; }
  / 'brown'                { return { term: 'Color', value: 'a52a2aff', location: location() }; }
  / 'Brown'                { return { term: 'Color', value: 'a52a2aff', location: location() }; }
  / 'burlywood'            { return { term: 'Color', value: 'deb887ff', location: location() }; }
  / 'BurlyWood'            { return { term: 'Color', value: 'deb887ff', location: location() }; }
  / 'cadetblue'            { return { term: 'Color', value: '5f9ea0ff', location: location() }; }
  / 'CadetBlue'            { return { term: 'Color', value: '5f9ea0ff', location: location() }; }
  / 'chartreuse'           { return { term: 'Color', value: '7fff00ff', location: location() }; }
  / 'Chartreuse'           { return { term: 'Color', value: '7fff00ff', location: location() }; }
  / 'chocolate'            { return { term: 'Color', value: 'd2691eff', location: location() }; }
  / 'Chocolate'            { return { term: 'Color', value: 'd2691eff', location: location() }; }
  / 'coral'                { return { term: 'Color', value: 'ff7f50ff', location: location() }; }
  / 'Coral'                { return { term: 'Color', value: 'ff7f50ff', location: location() }; }
  / 'cornflowerblue'       { return { term: 'Color', value: '6495edff', location: location() }; }
  / 'CornflowerBlue'       { return { term: 'Color', value: '6495edff', location: location() }; }
  / 'cornsilk'             { return { term: 'Color', value: 'fff8dcff', location: location() }; }
  / 'Cornsilk'             { return { term: 'Color', value: 'fff8dcff', location: location() }; }
  / 'crimson'              { return { term: 'Color', value: 'dc143cff', location: location() }; }
  / 'Crimson'              { return { term: 'Color', value: 'dc143cff', location: location() }; }
  / 'cyan'                 { return { term: 'Color', value: '00ffffff', location: location() }; }
  / 'Cyan'                 { return { term: 'Color', value: '00ffffff', location: location() }; }
  / 'darkblue'             { return { term: 'Color', value: '00008bff', location: location() }; }
  / 'DarkBlue'             { return { term: 'Color', value: '00008bff', location: location() }; }
  / 'darkcyan'             { return { term: 'Color', value: '008b8bff', location: location() }; }
  / 'DarkCyan'             { return { term: 'Color', value: '008b8bff', location: location() }; }
  / 'darkgoldenrod'        { return { term: 'Color', value: 'b8860bff', location: location() }; }
  / 'DarkGoldenRod'        { return { term: 'Color', value: 'b8860bff', location: location() }; }
  / 'darkgray'             { return { term: 'Color', value: 'a9a9a9ff', location: location() }; }
  / 'DarkGray'             { return { term: 'Color', value: 'a9a9a9ff', location: location() }; }
  / 'darkgrey'             { return { term: 'Color', value: 'a9a9a9ff', location: location() }; }
  / 'DarkGrey'             { return { term: 'Color', value: 'a9a9a9ff', location: location() }; }
  / 'darkgreen'            { return { term: 'Color', value: '006400ff', location: location() }; }
  / 'DarkGreen'            { return { term: 'Color', value: '006400ff', location: location() }; }
  / 'darkkhaki'            { return { term: 'Color', value: 'bdb76bff', location: location() }; }
  / 'DarkKhaki'            { return { term: 'Color', value: 'bdb76bff', location: location() }; }
  / 'darkmagenta'          { return { term: 'Color', value: '8b008bff', location: location() }; }
  / 'DarkMagenta'          { return { term: 'Color', value: '8b008bff', location: location() }; }
  / 'darkolivegreen'       { return { term: 'Color', value: '556b2fff', location: location() }; }
  / 'DarkOliveGreen'       { return { term: 'Color', value: '556b2fff', location: location() }; }
  / 'darkorange'           { return { term: 'Color', value: 'ff8c00ff', location: location() }; }
  / 'Darkorange'           { return { term: 'Color', value: 'ff8c00ff', location: location() }; }
  / 'darkorchid'           { return { term: 'Color', value: '9932ccff', location: location() }; }
  / 'DarkOrchid'           { return { term: 'Color', value: '9932ccff', location: location() }; }
  / 'darkred'              { return { term: 'Color', value: '8b0000ff', location: location() }; }
  / 'DarkRed'              { return { term: 'Color', value: '8b0000ff', location: location() }; }
  / 'darksalmon'           { return { term: 'Color', value: 'e9967aff', location: location() }; }
  / 'DarkSalmon'           { return { term: 'Color', value: 'e9967aff', location: location() }; }
  / 'darkseagreen'         { return { term: 'Color', value: '8fbc8fff', location: location() }; }
  / 'DarkSeaGreen'         { return { term: 'Color', value: '8fbc8fff', location: location() }; }
  / 'darkslateblue'        { return { term: 'Color', value: '483d8bff', location: location() }; }
  / 'DarkSlateBlue'        { return { term: 'Color', value: '483d8bff', location: location() }; }
  / 'darkslategray'        { return { term: 'Color', value: '2f4f4fff', location: location() }; }
  / 'DarkSlateGray'        { return { term: 'Color', value: '2f4f4fff', location: location() }; }
  / 'darkslategrey'        { return { term: 'Color', value: '2f4f4fff', location: location() }; }
  / 'DarkSlateGrey'        { return { term: 'Color', value: '2f4f4fff', location: location() }; }
  / 'darkturquoise'        { return { term: 'Color', value: '00ced1ff', location: location() }; }
  / 'DarkTurquoise'        { return { term: 'Color', value: '00ced1ff', location: location() }; }
  / 'darkviolet'           { return { term: 'Color', value: '9400d3ff', location: location() }; }
  / 'DarkViolet'           { return { term: 'Color', value: '9400d3ff', location: location() }; }
  / 'deeppink'             { return { term: 'Color', value: 'ff1493ff', location: location() }; }
  / 'DeepPink'             { return { term: 'Color', value: 'ff1493ff', location: location() }; }
  / 'deepskyblue'          { return { term: 'Color', value: '00bfffff', location: location() }; }
  / 'DeepSkyBlue'          { return { term: 'Color', value: '00bfffff', location: location() }; }
  / 'dimgray'              { return { term: 'Color', value: '696969ff', location: location() }; }
  / 'DimGray'              { return { term: 'Color', value: '696969ff', location: location() }; }
  / 'dimgrey'              { return { term: 'Color', value: '696969ff', location: location() }; }
  / 'DimGrey'              { return { term: 'Color', value: '696969ff', location: location() }; }
  / 'dodgerblue'           { return { term: 'Color', value: '1e90ffff', location: location() }; }
  / 'DodgerBlue'           { return { term: 'Color', value: '1e90ffff', location: location() }; }
  / 'firebrick'            { return { term: 'Color', value: 'b22222ff', location: location() }; }
  / 'FireBrick'            { return { term: 'Color', value: 'b22222ff', location: location() }; }
  / 'floralwhite'          { return { term: 'Color', value: 'fffaf0ff', location: location() }; }
  / 'FloralWhite'          { return { term: 'Color', value: 'fffaf0ff', location: location() }; }
  / 'forestgreen'          { return { term: 'Color', value: '228b22ff', location: location() }; }
  / 'ForestGreen'          { return { term: 'Color', value: '228b22ff', location: location() }; }
  / 'fuchsia'              { return { term: 'Color', value: 'ff00ffff', location: location() }; }
  / 'Fuchsia'              { return { term: 'Color', value: 'ff00ffff', location: location() }; }
  / 'gainsboro'            { return { term: 'Color', value: 'dcdcdcff', location: location() }; }
  / 'Gainsboro'            { return { term: 'Color', value: 'dcdcdcff', location: location() }; }
  / 'ghostwhite'           { return { term: 'Color', value: 'f8f8ffff', location: location() }; }
  / 'GhostWhite'           { return { term: 'Color', value: 'f8f8ffff', location: location() }; }
  / 'gold'                 { return { term: 'Color', value: 'ffd700ff', location: location() }; }
  / 'Gold'                 { return { term: 'Color', value: 'ffd700ff', location: location() }; }
  / 'goldenrod'            { return { term: 'Color', value: 'daa520ff', location: location() }; }
  / 'GoldenRod'            { return { term: 'Color', value: 'daa520ff', location: location() }; }
  / 'gray'                 { return { term: 'Color', value: '808080ff', location: location() }; }
  / 'Gray'                 { return { term: 'Color', value: '808080ff', location: location() }; }
  / 'grey'                 { return { term: 'Color', value: '808080ff', location: location() }; }
  / 'Grey'                 { return { term: 'Color', value: '808080ff', location: location() }; }
  / 'green'                { return { term: 'Color', value: '008000ff', location: location() }; }
  / 'Green'                { return { term: 'Color', value: '008000ff', location: location() }; }
  / 'greenyellow'          { return { term: 'Color', value: 'adff2fff', location: location() }; }
  / 'GreenYellow'          { return { term: 'Color', value: 'adff2fff', location: location() }; }
  / 'honeydew'             { return { term: 'Color', value: 'f0fff0ff', location: location() }; }
  / 'HoneyDew'             { return { term: 'Color', value: 'f0fff0ff', location: location() }; }
  / 'hotpink'              { return { term: 'Color', value: 'ff69b4ff', location: location() }; }
  / 'HotPink'              { return { term: 'Color', value: 'ff69b4ff', location: location() }; }
  / 'indianred'            { return { term: 'Color', value: 'cd5c5cff', location: location() }; }
  / 'IndianRed'            { return { term: 'Color', value: 'cd5c5cff', location: location() }; }
  / 'indigo'               { return { term: 'Color', value: '4b0082ff', location: location() }; }
  / 'Indigo'               { return { term: 'Color', value: '4b0082ff', location: location() }; }
  / 'ivory'                { return { term: 'Color', value: 'fffff0ff', location: location() }; }
  / 'Ivory'                { return { term: 'Color', value: 'fffff0ff', location: location() }; }
  / 'khaki'                { return { term: 'Color', value: 'f0e68cff', location: location() }; }
  / 'Khaki'                { return { term: 'Color', value: 'f0e68cff', location: location() }; }
  / 'lavender'             { return { term: 'Color', value: 'e6e6faff', location: location() }; }
  / 'Lavender'             { return { term: 'Color', value: 'e6e6faff', location: location() }; }
  / 'lavenderblush'        { return { term: 'Color', value: 'fff0f5ff', location: location() }; }
  / 'LavenderBlush'        { return { term: 'Color', value: 'fff0f5ff', location: location() }; }
  / 'lawngreen'            { return { term: 'Color', value: '7cfc00ff', location: location() }; }
  / 'LawnGreen'            { return { term: 'Color', value: '7cfc00ff', location: location() }; }
  / 'lemonchiffon'         { return { term: 'Color', value: 'fffacdff', location: location() }; }
  / 'LemonChiffon'         { return { term: 'Color', value: 'fffacdff', location: location() }; }
  / 'lightblue'            { return { term: 'Color', value: 'add8e6ff', location: location() }; }
  / 'LightBlue'            { return { term: 'Color', value: 'add8e6ff', location: location() }; }
  / 'lightcoral'           { return { term: 'Color', value: 'f08080ff', location: location() }; }
  / 'LightCoral'           { return { term: 'Color', value: 'f08080ff', location: location() }; }
  / 'lightcyan'            { return { term: 'Color', value: 'e0ffffff', location: location() }; }
  / 'LightCyan'            { return { term: 'Color', value: 'e0ffffff', location: location() }; }
  / 'lightgoldenrodyellow' { return { term: 'Color', value: 'fafad2ff', location: location() }; }
  / 'LightGoldenRodYellow' { return { term: 'Color', value: 'fafad2ff', location: location() }; }
  / 'lightgray'            { return { term: 'Color', value: 'd3d3d3ff', location: location() }; }
  / 'LightGray'            { return { term: 'Color', value: 'd3d3d3ff', location: location() }; }
  / 'lightgrey'            { return { term: 'Color', value: 'd3d3d3ff', location: location() }; }
  / 'LightGrey'            { return { term: 'Color', value: 'd3d3d3ff', location: location() }; }
  / 'lightgreen'           { return { term: 'Color', value: '90ee90ff', location: location() }; }
  / 'LightGreen'           { return { term: 'Color', value: '90ee90ff', location: location() }; }
  / 'lightpink'            { return { term: 'Color', value: 'ffb6c1ff', location: location() }; }
  / 'LightPink'            { return { term: 'Color', value: 'ffb6c1ff', location: location() }; }
  / 'lightsalmon'          { return { term: 'Color', value: 'ffa07aff', location: location() }; }
  / 'LightSalmon'          { return { term: 'Color', value: 'ffa07aff', location: location() }; }
  / 'lightseagreen'        { return { term: 'Color', value: '20b2aaff', location: location() }; }
  / 'LightSeaGreen'        { return { term: 'Color', value: '20b2aaff', location: location() }; }
  / 'lightskyblue'         { return { term: 'Color', value: '87cefaff', location: location() }; }
  / 'LightSkyBlue'         { return { term: 'Color', value: '87cefaff', location: location() }; }
  / 'lightslategray'       { return { term: 'Color', value: '778899ff', location: location() }; }
  / 'LightSlateGray'       { return { term: 'Color', value: '778899ff', location: location() }; }
  / 'lightslategrey'       { return { term: 'Color', value: '778899ff', location: location() }; }
  / 'LightSlateGrey'       { return { term: 'Color', value: '778899ff', location: location() }; }
  / 'lightsteelblue'       { return { term: 'Color', value: 'b0c4deff', location: location() }; }
  / 'LightSteelBlue'       { return { term: 'Color', value: 'b0c4deff', location: location() }; }
  / 'lightyellow'          { return { term: 'Color', value: 'ffffe0ff', location: location() }; }
  / 'LightYellow'          { return { term: 'Color', value: 'ffffe0ff', location: location() }; }
  / 'lime'                 { return { term: 'Color', value: '00ff00ff', location: location() }; }
  / 'Lime'                 { return { term: 'Color', value: '00ff00ff', location: location() }; }
  / 'limegreen'            { return { term: 'Color', value: '32cd32ff', location: location() }; }
  / 'LimeGreen'            { return { term: 'Color', value: '32cd32ff', location: location() }; }
  / 'linen'                { return { term: 'Color', value: 'faf0e6ff', location: location() }; }
  / 'Linen'                { return { term: 'Color', value: 'faf0e6ff', location: location() }; }
  / 'magenta'              { return { term: 'Color', value: 'ff00ffff', location: location() }; }
  / 'Magenta'              { return { term: 'Color', value: 'ff00ffff', location: location() }; }
  / 'maroon'               { return { term: 'Color', value: '800000ff', location: location() }; }
  / 'Maroon'               { return { term: 'Color', value: '800000ff', location: location() }; }
  / 'mediumaquamarine'     { return { term: 'Color', value: '66cdaaff', location: location() }; }
  / 'MediumAquaMarine'     { return { term: 'Color', value: '66cdaaff', location: location() }; }
  / 'mediumblue'           { return { term: 'Color', value: '0000cdff', location: location() }; }
  / 'MediumBlue'           { return { term: 'Color', value: '0000cdff', location: location() }; }
  / 'mediumorchid'         { return { term: 'Color', value: 'ba55d3ff', location: location() }; }
  / 'MediumOrchid'         { return { term: 'Color', value: 'ba55d3ff', location: location() }; }
  / 'mediumpurple'         { return { term: 'Color', value: '9370d8ff', location: location() }; }
  / 'MediumPurple'         { return { term: 'Color', value: '9370d8ff', location: location() }; }
  / 'mediumseagreen'       { return { term: 'Color', value: '3cb371ff', location: location() }; }
  / 'MediumSeaGreen'       { return { term: 'Color', value: '3cb371ff', location: location() }; }
  / 'mediumslateblue'      { return { term: 'Color', value: '7b68eeff', location: location() }; }
  / 'MediumSlateBlue'      { return { term: 'Color', value: '7b68eeff', location: location() }; }
  / 'mediumspringgreen'    { return { term: 'Color', value: '00fa9aff', location: location() }; }
  / 'MediumSpringGreen'    { return { term: 'Color', value: '00fa9aff', location: location() }; }
  / 'mediumturquoise'      { return { term: 'Color', value: '48d1ccff', location: location() }; }
  / 'MediumTurquoise'      { return { term: 'Color', value: '48d1ccff', location: location() }; }
  / 'mediumvioletred'      { return { term: 'Color', value: 'c71585ff', location: location() }; }
  / 'MediumVioletRed'      { return { term: 'Color', value: 'c71585ff', location: location() }; }
  / 'midnightblue'         { return { term: 'Color', value: '191970ff', location: location() }; }
  / 'MidnightBlue'         { return { term: 'Color', value: '191970ff', location: location() }; }
  / 'mintcream'            { return { term: 'Color', value: 'f5fffaff', location: location() }; }
  / 'MintCream'            { return { term: 'Color', value: 'f5fffaff', location: location() }; }
  / 'mistyrose'            { return { term: 'Color', value: 'ffe4e1ff', location: location() }; }
  / 'MistyRose'            { return { term: 'Color', value: 'ffe4e1ff', location: location() }; }
  / 'moccasin'             { return { term: 'Color', value: 'ffe4b5ff', location: location() }; }
  / 'Moccasin'             { return { term: 'Color', value: 'ffe4b5ff', location: location() }; }
  / 'navajowhite'          { return { term: 'Color', value: 'ffdeadff', location: location() }; }
  / 'NavajoWhite'          { return { term: 'Color', value: 'ffdeadff', location: location() }; }
  / 'navy'                 { return { term: 'Color', value: '000080ff', location: location() }; }
  / 'Navy'                 { return { term: 'Color', value: '000080ff', location: location() }; }
  / 'oldlace'              { return { term: 'Color', value: 'fdf5e6ff', location: location() }; }
  / 'OldLace'              { return { term: 'Color', value: 'fdf5e6ff', location: location() }; }
  / 'olive'                { return { term: 'Color', value: '808000ff', location: location() }; }
  / 'Olive'                { return { term: 'Color', value: '808000ff', location: location() }; }
  / 'olivedrab'            { return { term: 'Color', value: '6b8e23ff', location: location() }; }
  / 'OliveDrab'            { return { term: 'Color', value: '6b8e23ff', location: location() }; }
  / 'orange'               { return { term: 'Color', value: 'ffa500ff', location: location() }; }
  / 'Orange'               { return { term: 'Color', value: 'ffa500ff', location: location() }; }
  / 'orangered'            { return { term: 'Color', value: 'ff4500ff', location: location() }; }
  / 'OrangeRed'            { return { term: 'Color', value: 'ff4500ff', location: location() }; }
  / 'orchid'               { return { term: 'Color', value: 'da70d6ff', location: location() }; }
  / 'Orchid'               { return { term: 'Color', value: 'da70d6ff', location: location() }; }
  / 'palegoldenrod'        { return { term: 'Color', value: 'eee8aaff', location: location() }; }
  / 'PaleGoldenRod'        { return { term: 'Color', value: 'eee8aaff', location: location() }; }
  / 'palegreen'            { return { term: 'Color', value: '98fb98ff', location: location() }; }
  / 'PaleGreen'            { return { term: 'Color', value: '98fb98ff', location: location() }; }
  / 'paleturquoise'        { return { term: 'Color', value: 'afeeeeff', location: location() }; }
  / 'PaleTurquoise'        { return { term: 'Color', value: 'afeeeeff', location: location() }; }
  / 'palevioletred'        { return { term: 'Color', value: 'd87093ff', location: location() }; }
  / 'PaleVioletRed'        { return { term: 'Color', value: 'd87093ff', location: location() }; }
  / 'papayawhip'           { return { term: 'Color', value: 'ffefd5ff', location: location() }; }
  / 'PapayaWhip'           { return { term: 'Color', value: 'ffefd5ff', location: location() }; }
  / 'peachpuff'            { return { term: 'Color', value: 'ffdab9ff', location: location() }; }
  / 'PeachPuff'            { return { term: 'Color', value: 'ffdab9ff', location: location() }; }
  / 'peru'                 { return { term: 'Color', value: 'cd853fff', location: location() }; }
  / 'Peru'                 { return { term: 'Color', value: 'cd853fff', location: location() }; }
  / 'pink'                 { return { term: 'Color', value: 'ffc0cbff', location: location() }; }
  / 'Pink'                 { return { term: 'Color', value: 'ffc0cbff', location: location() }; }
  / 'plum'                 { return { term: 'Color', value: 'dda0ddff', location: location() }; }
  / 'Plum'                 { return { term: 'Color', value: 'dda0ddff', location: location() }; }
  / 'powderblue'           { return { term: 'Color', value: 'b0e0e6ff', location: location() }; }
  / 'PowderBlue'           { return { term: 'Color', value: 'b0e0e6ff', location: location() }; }
  / 'purple'               { return { term: 'Color', value: '800080ff', location: location() }; }
  / 'Purple'               { return { term: 'Color', value: '800080ff', location: location() }; }
  / 'red'                  { return { term: 'Color', value: 'ff0000ff', location: location() }; }
  / 'Red'                  { return { term: 'Color', value: 'ff0000ff', location: location() }; }
  / 'rosybrown'            { return { term: 'Color', value: 'bc8f8fff', location: location() }; }
  / 'RosyBrown'            { return { term: 'Color', value: 'bc8f8fff', location: location() }; }
  / 'royalblue'            { return { term: 'Color', value: '4169e1ff', location: location() }; }
  / 'RoyalBlue'            { return { term: 'Color', value: '4169e1ff', location: location() }; }
  / 'saddlebrown'          { return { term: 'Color', value: '8b4513ff', location: location() }; }
  / 'SaddleBrown'          { return { term: 'Color', value: '8b4513ff', location: location() }; }
  / 'salmon'               { return { term: 'Color', value: 'fa8072ff', location: location() }; }
  / 'Salmon'               { return { term: 'Color', value: 'fa8072ff', location: location() }; }
  / 'sandybrown'           { return { term: 'Color', value: 'f4a460ff', location: location() }; }
  / 'SandyBrown'           { return { term: 'Color', value: 'f4a460ff', location: location() }; }
  / 'seagreen'             { return { term: 'Color', value: '2e8b57ff', location: location() }; }
  / 'SeaGreen'             { return { term: 'Color', value: '2e8b57ff', location: location() }; }
  / 'seashell'             { return { term: 'Color', value: 'fff5eeff', location: location() }; }
  / 'SeaShell'             { return { term: 'Color', value: 'fff5eeff', location: location() }; }
  / 'sienna'               { return { term: 'Color', value: 'a0522dff', location: location() }; }
  / 'Sienna'               { return { term: 'Color', value: 'a0522dff', location: location() }; }
  / 'silver'               { return { term: 'Color', value: 'c0c0c0ff', location: location() }; }
  / 'Silver'               { return { term: 'Color', value: 'c0c0c0ff', location: location() }; }
  / 'skyblue'              { return { term: 'Color', value: '87ceebff', location: location() }; }
  / 'SkyBlue'              { return { term: 'Color', value: '87ceebff', location: location() }; }
  / 'slateblue'            { return { term: 'Color', value: '6a5acdff', location: location() }; }
  / 'SlateBlue'            { return { term: 'Color', value: '6a5acdff', location: location() }; }
  / 'slategray'            { return { term: 'Color', value: '708090ff', location: location() }; }
  / 'SlateGray'            { return { term: 'Color', value: '708090ff', location: location() }; }
  / 'slategrey'            { return { term: 'Color', value: '708090ff', location: location() }; }
  / 'SlateGrey'            { return { term: 'Color', value: '708090ff', location: location() }; }
  / 'snow'                 { return { term: 'Color', value: 'fffafaff', location: location() }; }
  / 'Snow'                 { return { term: 'Color', value: 'fffafaff', location: location() }; }
  / 'springgreen'          { return { term: 'Color', value: '00ff7fff', location: location() }; }
  / 'SpringGreen'          { return { term: 'Color', value: '00ff7fff', location: location() }; }
  / 'steelblue'            { return { term: 'Color', value: '4682b4ff', location: location() }; }
  / 'SteelBlue'            { return { term: 'Color', value: '4682b4ff', location: location() }; }
  / 'tan'                  { return { term: 'Color', value: 'd2b48cff', location: location() }; }
  / 'Tan'                  { return { term: 'Color', value: 'd2b48cff', location: location() }; }
  / 'teal'                 { return { term: 'Color', value: '008080ff', location: location() }; }
  / 'Teal'                 { return { term: 'Color', value: '008080ff', location: location() }; }
  / 'thistle'              { return { term: 'Color', value: 'd8bfd8ff', location: location() }; }
  / 'Thistle'              { return { term: 'Color', value: 'd8bfd8ff', location: location() }; }
  / 'tomato'               { return { term: 'Color', value: 'ff6347ff', location: location() }; }
  / 'Tomato'               { return { term: 'Color', value: 'ff6347ff', location: location() }; }
  / 'turquoise'            { return { term: 'Color', value: '40e0d0ff', location: location() }; }
  / 'Turquoise'            { return { term: 'Color', value: '40e0d0ff', location: location() }; }
  / 'violet'               { return { term: 'Color', value: 'ee82eeff', location: location() }; }
  / 'Violet'               { return { term: 'Color', value: 'ee82eeff', location: location() }; }
  / 'wheat'                { return { term: 'Color', value: 'f5deb3ff', location: location() }; }
  / 'Wheat'                { return { term: 'Color', value: 'f5deb3ff', location: location() }; }
  / 'white'                { return { term: 'Color', value: 'ffffffff', location: location() }; }
  / 'White'                { return { term: 'Color', value: 'ffffffff', location: location() }; }
  / 'whitesmoke'           { return { term: 'Color', value: 'f5f5f5ff', location: location() }; }
  / 'WhiteSmoke'           { return { term: 'Color', value: 'f5f5f5ff', location: location() }; }
  / 'yellow'               { return { term: 'Color', value: 'ffff00ff', location: location() }; }
  / 'Yellow'               { return { term: 'Color', value: 'ffff00ff', location: location() }; }
  / 'yellowgreen'          { return { term: 'Color', value: '9acd32ff', location: location() }; }
  / 'YellowGreen'          { return { term: 'Color', value: '9acd32ff', location: location() }; }


Rgb3
  = '#' r:_HexDigit g:_HexDigit b:_HexDigit _WS? {
    return { term: 'Color', value: `${r}${r}${g}${g}${b}${b}ff`, location: location() }; }

Rgb6
  = '#' r1:_HexDigit r2:_HexDigit g1:_HexDigit g2:_HexDigit b1:_HexDigit b2:_HexDigit _WS? {
    return { term: 'Color', value: `${r1}${r2}${g1}${g2}${b1}${b2}ff`, location: location() }; }

Rgba4
  = '#' r:_HexDigit g:_HexDigit b:_HexDigit a:_HexDigit _WS? {
    return { term: 'Color', value: `${r}${r}${g}${g}${b}${b}${a}${a}`, location: location() }; }

Rgba8
  = '#' r1:_HexDigit r2:_HexDigit g1:_HexDigit g2:_HexDigit b1:_HexDigit b2:_HexDigit a1:_HexDigit a2:_HexDigit _WS? {
    return { term: 'Color', value: `${r1}${r2}${g1}${g2}${b1}${b2}${a1}${a2}`, location: location() }; }

Color "color"   // hoboy
  = NamedColor
  / Rgba8
  / Rgb6
  / Rgba4
  / Rgb3


Arrow "arrow"
  = MixedArrow / LightArrow / FatArrow / TildeArrow





ForwardLightArrow "forward light arrow ->"
  = "->"  { return { term: "arrow", location: location(), value: "->" };  }
  / "→"   { return { term: "arrow", location: location(), value: "->" };  }

TwoWayLightArrow "two way light arrow <->"
  = "<->" { return { term: "arrow", location: location(), value: "<->" }; }
  / "↔"   { return { term: "arrow", location: location(), value: "<->" }; }

BackLightArrow "back light arrow <-"
  = "<-"  { return { term: "arrow", location: location(), value: "<-" };  }
  / "←"   { return { term: "arrow", location: location(), value: "<-" };  }



ForwardFatArrow "forward fat arrow =>"
  = "=>"  { return { term: "arrow", location: location(), value: "=>" };  }
  / "⇒"   { return { term: "arrow", location: location(), value: "=>" };  }

TwoWayFatArrow "two way fat arrow <=>"
  = "<=>" { return { term: "arrow", location: location(), value: "<=>" }; }
  / "⇔"   { return { term: "arrow", location: location(), value: "<=>" }; }

BackFatArrow "back fat arrow <="
  = "<="  { return { term: "arrow", location: location(), value: "<=" };  }
  / "⇐"   { return { term: "arrow", location: location(), value: "<=" };  }



ForwardTildeArrow "forward tilde arrow ~>"
  = "~>"  { return { term: "arrow", location: location(), value: "~>" };  }
  / "↛"   { return { term: "arrow", location: location(), value: "~>" };  }

TwoWayTildeArrow "two way tilde arrow <~>"
  = "<~>" { return { term: "arrow", location: location(), value: "<~>" }; }
  / "↮"   { return { term: "arrow", location: location(), value: "<~>" }; }

BackTildeArrow "back tilde arrow <~"
  = "<~"  { return { term: "arrow", location: location(), value: "<~" };  }
  / "↚"   { return { term: "arrow", location: location(), value: "<~" };  }




LightFatArrow "light fat arrow <-=>"
  = "<-=>" { return { term: "arrow", location: location(), value: "<-=>" }; }
  / "<-⇒"  { return { term: "arrow", location: location(), value: "<-=>" }; }
  / "←=>"  { return { term: "arrow", location: location(), value: "<-=>" }; }
  / "←⇒"   { return { term: "arrow", location: location(), value: "<-=>" }; }

LightTildeArrow "light tilde arrow <-~>"
  = "<-~>" { return { term: "arrow", location: location(), value: "<-~>" }; }
  / "←~>"  { return { term: "arrow", location: location(), value: "<-~>" }; }
  / "<-↛"  { return { term: "arrow", location: location(), value: "<-~>" }; }
  / "←↛"   { return { term: "arrow", location: location(), value: "<-~>" }; }

FatLightArrow "fat light arrow <=->"
  = "<=->" { return { term: "arrow", location: location(), value: "<=->" }; }
  / "⇐->"  { return { term: "arrow", location: location(), value: "<=->" }; }
  / "<=→"  { return { term: "arrow", location: location(), value: "<=->" }; }
  / "⇐→"   { return { term: "arrow", location: location(), value: "<=->" }; }

FatTildeArrow "fat tilde arrow <=~>"
  = "<=~>" { return { term: "arrow", location: location(), value: "<=~>" }; }
  / "⇐~>"  { return { term: "arrow", location: location(), value: "<=~>" }; }
  / "<=↛"  { return { term: "arrow", location: location(), value: "<=~>" }; }
  / "⇐↛"   { return { term: "arrow", location: location(), value: "<=~>" }; }

TildeLightArrow "tilde light arrow <~->"
  = "<~->" { return { term: "arrow", location: location(), value: "<~->" }; }
  / "↚->"  { return { term: "arrow", location: location(), value: "<~->" }; }
  / "<~→"  { return { term: "arrow", location: location(), value: "<~->" }; }
  / "↚→"   { return { term: "arrow", location: location(), value: "<~->" }; }

TildeFatArrow "tilde fat arrow <~=>"
  = "<~=>" { return { term: "arrow", location: location(), value: "<~=>" }; }
  / "↚=>"  { return { term: "arrow", location: location(), value: "<~=>" }; }
  / "<~⇒"  { return { term: "arrow", location: location(), value: "<~=>" }; }
  / "↚⇒"   { return { term: "arrow", location: location(), value: "<~=>" }; }





LightArrow "light arrow"
  = ForwardLightArrow / TwoWayLightArrow / BackLightArrow

FatArrow "fat arrow"
  = ForwardFatArrow / TwoWayFatArrow / BackFatArrow

TildeArrow "tilde arrow"
  = ForwardTildeArrow / TwoWayTildeArrow / BackTildeArrow

MixedArrow "mixed arrow"
  = LightFatArrow / LightTildeArrow / FatLightArrow / FatTildeArrow / TildeLightArrow / TildeFatArrow


ArrowItemKey
  = "arc_label"
  / "head_label"
  / "tail_label"

ArrowItem
  = term:ArrowItemKey _WS? ":" _WS? value:_Label _WS? ";" _WS? { return { term, value }; }

SingleEdgeColor "single edge color"
  = _WS? "edge_color" _WS? ":" _WS? value:Color _WS? ";" _WS? { return {key:'single_edge_color', value:value}; }

ArrowItems
  = SingleEdgeColor
  / ArrowItem+

ArrowDesc
  = "{" _WS? items:ArrowItems? _WS? "}" { return items; }

ArrowProbability
  = value:NonNegNumber "%" { return { key: 'arrow probability', value: value }; }



ArrowTarget
  = Stripe
  / Cycle
  / _LabelList
  / _Label


_ShapeList
  = "box"            / "polygon"        / "ellipse"          / "oval"           / "circle"          / "point"
  / "egg"            / "triangle"       / "plaintext"        / "plain"          / "diamond"         / "trapezium"
  / "parallelogram"  / "house"          / "pentagon"         / "hexagon"        / "septagon"        / "octagon"
  / "doublecircle"   / "doubleoctagon"  / "tripleoctagon"    / "invtriangle"    / "invtrapezium"    / "invhouse"
  / "Mdiamond"       / "Msquare"        / "Mcircle"          / "rect"           / "rectangle"       / "square"
  / "star"           / "none"           / "underline"        / "cylinder"       / "note"            / "tab"
  / "folder"         / "box3d"          / "component"        / "promoter"       / "cds"             / "terminator"
  / "utr"            / "primersite"     / "restrictionsite"  / "fivepoverhang"  / "threepoverhang"  / "noverhang"
  / "assembly"       / "signature"      / "insulator"        / "ribosite"       / "rnastab"         / "proteasesite"
  / "proteinstab"    / "rpromoter"      / "rarrow"           / "larrow"         / "lpromoter"       / "record"





Shape "shape"
 = value:_ShapeList { return { term: 'Shape', value, location: location() }; }


Stripe "stripe"
  = '+|' value:NonNegIntegerLiteral { return { key: 'stripe', value,                  location: location() }; }
  / '-|' value:NonNegIntegerLiteral { return { key: 'stripe', value: signflip(value), location: location() }; }

Cycle "cycle"
  = '+'  value:NonNegIntegerLiteral { return { key: 'cycle',  value,                  location: location() }; }
  / '-'  value:NonNegIntegerLiteral { return { key: 'cycle',  value: signflip(value), location: location() }; }


MachineConfigTransition
  = "transition" _WS? ":" _WS? "{" _WS? value:ConfigTransitionItems* _WS? "};" _WS? {
    return { key: "config", config_topic: "transition", value, location: location() };
  }





MachineConfigStartState
  = "start_state" _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { key: "config", config_topic: "start_state", value, location: location() };
  }

MachineConfigEndState
  = "end_state"   _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { key: "config", config_topic: "end_state", value, location: location() };
  }

MachineConfigState
  = "state"       _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { key: "config", config_topic: "state", value, location: location() };
  }





MachineConfig "machine config"
  = MachineConfigTransition
  / MachineConfigStartState
  / MachineConfigEndState
  / MachineConfigState



_TransitionKey_HeadType
  = "arrow_head"
  / "reverse_arrow_head"


ConfigTransitionItem_Head
  = transitionkey:_TransitionKey_HeadType _WS? ":" _WS? value:ArrowHead _WS? ";" _WS? {
    return { key: transitionkey, value, location: location() };
  }





_TransitionKey_Color
  = "edge_color"
  / "reverse_edge_color"


ConfigTransitionItem_Color
  = transitionkey:_TransitionKey_Color _WS? ":" _WS? value:Color _WS? ";" _WS? {
    return { key: transitionkey, value, location: location() };
  }





ConfigTransitionItems
  = ConfigTransitionItem_Color
  / ConfigTransitionItem_Head


_StateItemThingKey_Shape
  = "node_shape"

ConfigStateItemThings_Shape
  = value:_StateItemThingKey_Shape  { return { term: 'Shape', value, location: location() }; }





_StateItemThingKey_Color
  = "node_color"
  / "node_border_color"

ConfigStateItemThings_Color
  = _StateItemThingKey_Color






ConfigStateItemThings
  = ConfigStateItemThings_Shape
  / ConfigStateItemThings_Color





ConfigStateItems
  = value:ConfigStateItemThings { return { term: 'Config_StateItem', value, location() }; }


_ArrowHeadList
 = "box"       / "lbox"       / "rbox"       / "obox"      / "olbox"     / "orbox"
 / "crow"      / "lcrow"      / "rcrow"      / "diamond"   / "ldiamond"  / "rdiamond"
 / "odiamond"  / "oldiamond"  / "ordiamond"  / "dot"       / "odot"      / "inv"
 / "linv"      / "rinv"       / "oinv"       / "olinv"     / "orinv"     / "none"
 / "normal"    / "lnormal"    / "rnormal"    / "onormal"   / "olnormal"  / "ornormal"
 / "tee"       / "ltee"       / "rtee"       / "vee"       / "lvee"      / "rvee"
 / "curve"     / "lcurve"     / "rcurve"     / "icurve"    / "licurve"   / "ricurve"





ArrowHead "shape"
 = value:_ArrowHeadList { return { term: 'ArrowHead', value, location: location() }; }

ReverseArrowHead "shape"
 = value:_ArrowHeadList { return { term: 'ArrowHead', value, location: location() }; }
