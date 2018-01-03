
{

  // used in cycles and stripes
  function signflip({ term, value, location }) {
    return { term, value: value * -1, location };
  }

}


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
  = _BlockComment _WS? { return { term: 'whitespace', value: undefined, location: location() }; }
  / _LineComment  _WS? { return { term: 'whitespace', value: undefined, location: location() }; }
  / [ \t\r\n\v]+  _WS? { return { term: 'whitespace', value: undefined, location: location() }; }


_UrlProtocol
  = 'hsts'
  / 'http'
  / 'https'
  / 'hxxp'
  / 'hxxps'
  / 'shttp'
  / 'ftp'
  / 'sftp'
  / 'rsync'
  / 'tftp'
  / 'git'
  / 'svn'
  / 'file'
  / 'filesystem'
  / 'res'
  / 'resource'
  / 'appdata'
  / 'data'
  / 'redis'
  / 'service'

URL "url"
  = protocol:_UrlProtocol ":" [a-zA-Z0-9\!\*\'\(\)\:\;\@\&\=\+\$\,\/\?\#\[\]\_\.\~\-]+ {
  	return { term: "url", protocol, value: text(), location: location() };
  }


GvizLayoutType "gviz layout_type"
  = "dot"   { return { term: "layout_type", value: "dot",   location: location() }; }
  / "circo" { return { term: "layout_type", value: "circo", location: location() }; }
  / "fdp"   { return { term: "layout_type", value: "fdp",   location: location() }; }
  / "neato" { return { term: "layout_type", value: "neato", location: location() }; }

GraphLayout "graph layout"
  = "graph_layout" _WS? ":" _WS? value:GvizLayoutType _WS? ";" _WS? { return { term: "Graph Layout", value, location: location() }; }


/* whargarbl there's a lot of todo down here */

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
  = _QuoteMark chars:_Char* _QuoteMark {
    return { type: "label", written_as: "string", value: chars.join(""), location: location() };
  }





_AtomFirstLetter
  = [0-9a-zA-Z\.\_\!\$\^\*\!\?\,\x80-\uFFFF]

_AtomLetter
  = [0-9a-zA-Z\.\+\=\_\^\(\)\*\&\$\#\@\!\?\,\x80-\uFFFF]

_Atom "atom"
  = firstletter:_AtomFirstLetter text:_AtomLetter* {
      const value = firstletter + ((text || []).join(''));
      return { type: "label", written_as: "atom", value, location: location() };
    }





_Label "label"
  = atom:_Atom
  / string:_String

_LabelList "label list"
  = "[" _WS? names:(_Label _WS?)* "]" {
    return { type: "label_list", value: names.map(i => i[0]), location: location() };
  }

_LabelOrLabelList "label or label list"
  = _LabelList
  / _Label


LicenseNotation "license"
  = 'MIT'                    { return { term: 'license', value: 'MIT',           known: true,  viral: false,     location: location() }; }
  / 'BSD 2-clause'           { return { term: 'license', value: 'BSD 2-clause',  known: true,  viral: false,     location: location() }; }
  / 'BSD 3-clause'           { return { term: 'license', value: 'BSD 3-clause',  known: true,  viral: false,     location: location() }; }
  / 'Apache 2.0'             { return { term: 'license', value: 'Apache 2.0',    known: true,  viral: false,     location: location() }; }
  / 'Mozilla 2.0'            { return { term: 'license', value: 'Mozilla 2.0',   known: true,  viral: false,     location: location() }; }
  / 'Public domain'          { return { term: 'license', value: 'Public domain', known: true,  viral: false,     location: location() }; }
  / 'GPL v2'                 { return { term: 'license', value: 'GPL v2',        known: true,  viral: true,      location: location() }; }
  / 'GPL v3'                 { return { term: 'license', value: 'GPV v3',        known: true,  viral: true,      location: location() }; }
  / 'LGPL v2.1'              { return { term: 'license', value: 'LGPL v2.1',     known: true,  viral: true,      location: location() }; }
  / 'LGPL v3.0'              { return { term: 'license', value: 'LGPL v3.0',     known: true,  viral: true,      location: location() }; }
  / 'Unknown license'        { return { term: 'license', value: undefined,       known: false, viral: undefined, location: location() }; }
  / 'License ' custom:_Label { return { term: 'license', value: custom,          known: true,  viral: undefined, location: location() }; }


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
      term   : 'semver',

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


// todo whargarbl turn this to 'foo'i style rules

NamedColor "named color"
  = 'aliceblue'            { return { term: 'color', value: 'f0f8ff', location: location() }; }
  / 'AliceBlue'            { return { term: 'color', value: 'f0f8ff', location: location() }; }
  / 'antiquewhite'         { return { term: 'color', value: 'faebd7', location: location() }; }
  / 'AntiqueWhite'         { return { term: 'color', value: 'faebd7', location: location() }; }
  / 'aqua'                 { return { term: 'color', value: '00ffff', location: location() }; }
  / 'Aqua'                 { return { term: 'color', value: '00ffff', location: location() }; }
  / 'aquamarine'           { return { term: 'color', value: '7fffd4', location: location() }; }
  / 'Aquamarine'           { return { term: 'color', value: '7fffd4', location: location() }; }
  / 'azure'                { return { term: 'color', value: 'f0ffff', location: location() }; }
  / 'Azure'                { return { term: 'color', value: 'f0ffff', location: location() }; }
  / 'beige'                { return { term: 'color', value: 'f5f5dc', location: location() }; }
  / 'Beige'                { return { term: 'color', value: 'f5f5dc', location: location() }; }
  / 'bisque'               { return { term: 'color', value: 'ffe4c4', location: location() }; }
  / 'Bisque'               { return { term: 'color', value: 'ffe4c4', location: location() }; }
  / 'black'                { return { term: 'color', value: '000000', location: location() }; }
  / 'Black'                { return { term: 'color', value: '000000', location: location() }; }
  / 'blanchedalmond'       { return { term: 'color', value: 'ffebcd', location: location() }; }
  / 'BlanchedAlmond'       { return { term: 'color', value: 'ffebcd', location: location() }; }
  / 'blue'                 { return { term: 'color', value: '0000ff', location: location() }; }
  / 'Blue'                 { return { term: 'color', value: '0000ff', location: location() }; }
  / 'blueviolet'           { return { term: 'color', value: '8a2be2', location: location() }; }
  / 'BlueViolet'           { return { term: 'color', value: '8a2be2', location: location() }; }
  / 'brown'                { return { term: 'color', value: 'a52a2a', location: location() }; }
  / 'Brown'                { return { term: 'color', value: 'a52a2a', location: location() }; }
  / 'burlywood'            { return { term: 'color', value: 'deb887', location: location() }; }
  / 'BurlyWood'            { return { term: 'color', value: 'deb887', location: location() }; }
  / 'cadetblue'            { return { term: 'color', value: '5f9ea0', location: location() }; }
  / 'CadetBlue'            { return { term: 'color', value: '5f9ea0', location: location() }; }
  / 'chartreuse'           { return { term: 'color', value: '7fff00', location: location() }; }
  / 'Chartreuse'           { return { term: 'color', value: '7fff00', location: location() }; }
  / 'chocolate'            { return { term: 'color', value: 'd2691e', location: location() }; }
  / 'Chocolate'            { return { term: 'color', value: 'd2691e', location: location() }; }
  / 'coral'                { return { term: 'color', value: 'ff7f50', location: location() }; }
  / 'Coral'                { return { term: 'color', value: 'ff7f50', location: location() }; }
  / 'cornflowerblue'       { return { term: 'color', value: '6495ed', location: location() }; }
  / 'CornflowerBlue'       { return { term: 'color', value: '6495ed', location: location() }; }
  / 'cornsilk'             { return { term: 'color', value: 'fff8dc', location: location() }; }
  / 'Cornsilk'             { return { term: 'color', value: 'fff8dc', location: location() }; }
  / 'crimson'              { return { term: 'color', value: 'dc143c', location: location() }; }
  / 'Crimson'              { return { term: 'color', value: 'dc143c', location: location() }; }
  / 'cyan'                 { return { term: 'color', value: '00ffff', location: location() }; }
  / 'Cyan'                 { return { term: 'color', value: '00ffff', location: location() }; }
  / 'darkblue'             { return { term: 'color', value: '00008b', location: location() }; }
  / 'DarkBlue'             { return { term: 'color', value: '00008b', location: location() }; }
  / 'darkcyan'             { return { term: 'color', value: '008b8b', location: location() }; }
  / 'DarkCyan'             { return { term: 'color', value: '008b8b', location: location() }; }
  / 'darkgoldenrod'        { return { term: 'color', value: 'b8860b', location: location() }; }
  / 'DarkGoldenRod'        { return { term: 'color', value: 'b8860b', location: location() }; }
  / 'darkgray'             { return { term: 'color', value: 'a9a9a9', location: location() }; }
  / 'DarkGray'             { return { term: 'color', value: 'a9a9a9', location: location() }; }
  / 'darkgrey'             { return { term: 'color', value: 'a9a9a9', location: location() }; }
  / 'DarkGrey'             { return { term: 'color', value: 'a9a9a9', location: location() }; }
  / 'darkgreen'            { return { term: 'color', value: '006400', location: location() }; }
  / 'DarkGreen'            { return { term: 'color', value: '006400', location: location() }; }
  / 'darkkhaki'            { return { term: 'color', value: 'bdb76b', location: location() }; }
  / 'DarkKhaki'            { return { term: 'color', value: 'bdb76b', location: location() }; }
  / 'darkmagenta'          { return { term: 'color', value: '8b008b', location: location() }; }
  / 'DarkMagenta'          { return { term: 'color', value: '8b008b', location: location() }; }
  / 'darkolivegreen'       { return { term: 'color', value: '556b2f', location: location() }; }
  / 'DarkOliveGreen'       { return { term: 'color', value: '556b2f', location: location() }; }
  / 'darkorange'           { return { term: 'color', value: 'ff8c00', location: location() }; }
  / 'Darkorange'           { return { term: 'color', value: 'ff8c00', location: location() }; }
  / 'darkorchid'           { return { term: 'color', value: '9932cc', location: location() }; }
  / 'DarkOrchid'           { return { term: 'color', value: '9932cc', location: location() }; }
  / 'darkred'              { return { term: 'color', value: '8b0000', location: location() }; }
  / 'DarkRed'              { return { term: 'color', value: '8b0000', location: location() }; }
  / 'darksalmon'           { return { term: 'color', value: 'e9967a', location: location() }; }
  / 'DarkSalmon'           { return { term: 'color', value: 'e9967a', location: location() }; }
  / 'darkseagreen'         { return { term: 'color', value: '8fbc8f', location: location() }; }
  / 'DarkSeaGreen'         { return { term: 'color', value: '8fbc8f', location: location() }; }
  / 'darkslateblue'        { return { term: 'color', value: '483d8b', location: location() }; }
  / 'DarkSlateBlue'        { return { term: 'color', value: '483d8b', location: location() }; }
  / 'darkslategray'        { return { term: 'color', value: '2f4f4f', location: location() }; }
  / 'DarkSlateGray'        { return { term: 'color', value: '2f4f4f', location: location() }; }
  / 'darkslategrey'        { return { term: 'color', value: '2f4f4f', location: location() }; }
  / 'DarkSlateGrey'        { return { term: 'color', value: '2f4f4f', location: location() }; }
  / 'darkturquoise'        { return { term: 'color', value: '00ced1', location: location() }; }
  / 'DarkTurquoise'        { return { term: 'color', value: '00ced1', location: location() }; }
  / 'darkviolet'           { return { term: 'color', value: '9400d3', location: location() }; }
  / 'DarkViolet'           { return { term: 'color', value: '9400d3', location: location() }; }
  / 'deeppink'             { return { term: 'color', value: 'ff1493', location: location() }; }
  / 'DeepPink'             { return { term: 'color', value: 'ff1493', location: location() }; }
  / 'deepskyblue'          { return { term: 'color', value: '00bfff', location: location() }; }
  / 'DeepSkyBlue'          { return { term: 'color', value: '00bfff', location: location() }; }
  / 'dimgray'              { return { term: 'color', value: '696969', location: location() }; }
  / 'DimGray'              { return { term: 'color', value: '696969', location: location() }; }
  / 'dimgrey'              { return { term: 'color', value: '696969', location: location() }; }
  / 'DimGrey'              { return { term: 'color', value: '696969', location: location() }; }
  / 'dodgerblue'           { return { term: 'color', value: '1e90ff', location: location() }; }
  / 'DodgerBlue'           { return { term: 'color', value: '1e90ff', location: location() }; }
  / 'firebrick'            { return { term: 'color', value: 'b22222', location: location() }; }
  / 'FireBrick'            { return { term: 'color', value: 'b22222', location: location() }; }
  / 'floralwhite'          { return { term: 'color', value: 'fffaf0', location: location() }; }
  / 'FloralWhite'          { return { term: 'color', value: 'fffaf0', location: location() }; }
  / 'forestgreen'          { return { term: 'color', value: '228b22', location: location() }; }
  / 'ForestGreen'          { return { term: 'color', value: '228b22', location: location() }; }
  / 'fuchsia'              { return { term: 'color', value: 'ff00ff', location: location() }; }
  / 'Fuchsia'              { return { term: 'color', value: 'ff00ff', location: location() }; }
  / 'gainsboro'            { return { term: 'color', value: 'dcdcdc', location: location() }; }
  / 'Gainsboro'            { return { term: 'color', value: 'dcdcdc', location: location() }; }
  / 'ghostwhite'           { return { term: 'color', value: 'f8f8ff', location: location() }; }
  / 'GhostWhite'           { return { term: 'color', value: 'f8f8ff', location: location() }; }
  / 'gold'                 { return { term: 'color', value: 'ffd700', location: location() }; }
  / 'Gold'                 { return { term: 'color', value: 'ffd700', location: location() }; }
  / 'goldenrod'            { return { term: 'color', value: 'daa520', location: location() }; }
  / 'GoldenRod'            { return { term: 'color', value: 'daa520', location: location() }; }
  / 'gray'                 { return { term: 'color', value: '808080', location: location() }; }
  / 'Gray'                 { return { term: 'color', value: '808080', location: location() }; }
  / 'grey'                 { return { term: 'color', value: '808080', location: location() }; }
  / 'Grey'                 { return { term: 'color', value: '808080', location: location() }; }
  / 'green'                { return { term: 'color', value: '008000', location: location() }; }
  / 'Green'                { return { term: 'color', value: '008000', location: location() }; }
  / 'greenyellow'          { return { term: 'color', value: 'adff2f', location: location() }; }
  / 'GreenYellow'          { return { term: 'color', value: 'adff2f', location: location() }; }
  / 'honeydew'             { return { term: 'color', value: 'f0fff0', location: location() }; }
  / 'HoneyDew'             { return { term: 'color', value: 'f0fff0', location: location() }; }
  / 'hotpink'              { return { term: 'color', value: 'ff69b4', location: location() }; }
  / 'HotPink'              { return { term: 'color', value: 'ff69b4', location: location() }; }
  / 'indianred'            { return { term: 'color', value: 'cd5c5c', location: location() }; }
  / 'IndianRed'            { return { term: 'color', value: 'cd5c5c', location: location() }; }
  / 'indigo'               { return { term: 'color', value: '4b0082', location: location() }; }
  / 'Indigo'               { return { term: 'color', value: '4b0082', location: location() }; }
  / 'ivory'                { return { term: 'color', value: 'fffff0', location: location() }; }
  / 'Ivory'                { return { term: 'color', value: 'fffff0', location: location() }; }
  / 'khaki'                { return { term: 'color', value: 'f0e68c', location: location() }; }
  / 'Khaki'                { return { term: 'color', value: 'f0e68c', location: location() }; }
  / 'lavender'             { return { term: 'color', value: 'e6e6fa', location: location() }; }
  / 'Lavender'             { return { term: 'color', value: 'e6e6fa', location: location() }; }
  / 'lavenderblush'        { return { term: 'color', value: 'fff0f5', location: location() }; }
  / 'LavenderBlush'        { return { term: 'color', value: 'fff0f5', location: location() }; }
  / 'lawngreen'            { return { term: 'color', value: '7cfc00', location: location() }; }
  / 'LawnGreen'            { return { term: 'color', value: '7cfc00', location: location() }; }
  / 'lemonchiffon'         { return { term: 'color', value: 'fffacd', location: location() }; }
  / 'LemonChiffon'         { return { term: 'color', value: 'fffacd', location: location() }; }
  / 'lightblue'            { return { term: 'color', value: 'add8e6', location: location() }; }
  / 'LightBlue'            { return { term: 'color', value: 'add8e6', location: location() }; }
  / 'lightcoral'           { return { term: 'color', value: 'f08080', location: location() }; }
  / 'LightCoral'           { return { term: 'color', value: 'f08080', location: location() }; }
  / 'lightcyan'            { return { term: 'color', value: 'e0ffff', location: location() }; }
  / 'LightCyan'            { return { term: 'color', value: 'e0ffff', location: location() }; }
  / 'lightgoldenrodyellow' { return { term: 'color', value: 'fafad2', location: location() }; }
  / 'LightGoldenRodYellow' { return { term: 'color', value: 'fafad2', location: location() }; }
  / 'lightgray'            { return { term: 'color', value: 'd3d3d3', location: location() }; }
  / 'LightGray'            { return { term: 'color', value: 'd3d3d3', location: location() }; }
  / 'lightgrey'            { return { term: 'color', value: 'd3d3d3', location: location() }; }
  / 'LightGrey'            { return { term: 'color', value: 'd3d3d3', location: location() }; }
  / 'lightgreen'           { return { term: 'color', value: '90ee90', location: location() }; }
  / 'LightGreen'           { return { term: 'color', value: '90ee90', location: location() }; }
  / 'lightpink'            { return { term: 'color', value: 'ffb6c1', location: location() }; }
  / 'LightPink'            { return { term: 'color', value: 'ffb6c1', location: location() }; }
  / 'lightsalmon'          { return { term: 'color', value: 'ffa07a', location: location() }; }
  / 'LightSalmon'          { return { term: 'color', value: 'ffa07a', location: location() }; }
  / 'lightseagreen'        { return { term: 'color', value: '20b2aa', location: location() }; }
  / 'LightSeaGreen'        { return { term: 'color', value: '20b2aa', location: location() }; }
  / 'lightskyblue'         { return { term: 'color', value: '87cefa', location: location() }; }
  / 'LightSkyBlue'         { return { term: 'color', value: '87cefa', location: location() }; }
  / 'lightslategray'       { return { term: 'color', value: '778899', location: location() }; }
  / 'LightSlateGray'       { return { term: 'color', value: '778899', location: location() }; }
  / 'lightslategrey'       { return { term: 'color', value: '778899', location: location() }; }
  / 'LightSlateGrey'       { return { term: 'color', value: '778899', location: location() }; }
  / 'lightsteelblue'       { return { term: 'color', value: 'b0c4de', location: location() }; }
  / 'LightSteelBlue'       { return { term: 'color', value: 'b0c4de', location: location() }; }
  / 'lightyellow'          { return { term: 'color', value: 'ffffe0', location: location() }; }
  / 'LightYellow'          { return { term: 'color', value: 'ffffe0', location: location() }; }
  / 'lime'                 { return { term: 'color', value: '00ff00', location: location() }; }
  / 'Lime'                 { return { term: 'color', value: '00ff00', location: location() }; }
  / 'limegreen'            { return { term: 'color', value: '32cd32', location: location() }; }
  / 'LimeGreen'            { return { term: 'color', value: '32cd32', location: location() }; }
  / 'linen'                { return { term: 'color', value: 'faf0e6', location: location() }; }
  / 'Linen'                { return { term: 'color', value: 'faf0e6', location: location() }; }
  / 'magenta'              { return { term: 'color', value: 'ff00ff', location: location() }; }
  / 'Magenta'              { return { term: 'color', value: 'ff00ff', location: location() }; }
  / 'maroon'               { return { term: 'color', value: '800000', location: location() }; }
  / 'Maroon'               { return { term: 'color', value: '800000', location: location() }; }
  / 'mediumaquamarine'     { return { term: 'color', value: '66cdaa', location: location() }; }
  / 'MediumAquaMarine'     { return { term: 'color', value: '66cdaa', location: location() }; }
  / 'mediumblue'           { return { term: 'color', value: '0000cd', location: location() }; }
  / 'MediumBlue'           { return { term: 'color', value: '0000cd', location: location() }; }
  / 'mediumorchid'         { return { term: 'color', value: 'ba55d3', location: location() }; }
  / 'MediumOrchid'         { return { term: 'color', value: 'ba55d3', location: location() }; }
  / 'mediumpurple'         { return { term: 'color', value: '9370d8', location: location() }; }
  / 'MediumPurple'         { return { term: 'color', value: '9370d8', location: location() }; }
  / 'mediumseagreen'       { return { term: 'color', value: '3cb371', location: location() }; }
  / 'MediumSeaGreen'       { return { term: 'color', value: '3cb371', location: location() }; }
  / 'mediumslateblue'      { return { term: 'color', value: '7b68ee', location: location() }; }
  / 'MediumSlateBlue'      { return { term: 'color', value: '7b68ee', location: location() }; }
  / 'mediumspringgreen'    { return { term: 'color', value: '00fa9a', location: location() }; }
  / 'MediumSpringGreen'    { return { term: 'color', value: '00fa9a', location: location() }; }
  / 'mediumturquoise'      { return { term: 'color', value: '48d1cc', location: location() }; }
  / 'MediumTurquoise'      { return { term: 'color', value: '48d1cc', location: location() }; }
  / 'mediumvioletred'      { return { term: 'color', value: 'c71585', location: location() }; }
  / 'MediumVioletRed'      { return { term: 'color', value: 'c71585', location: location() }; }
  / 'midnightblue'         { return { term: 'color', value: '191970', location: location() }; }
  / 'MidnightBlue'         { return { term: 'color', value: '191970', location: location() }; }
  / 'mintcream'            { return { term: 'color', value: 'f5fffa', location: location() }; }
  / 'MintCream'            { return { term: 'color', value: 'f5fffa', location: location() }; }
  / 'mistyrose'            { return { term: 'color', value: 'ffe4e1', location: location() }; }
  / 'MistyRose'            { return { term: 'color', value: 'ffe4e1', location: location() }; }
  / 'moccasin'             { return { term: 'color', value: 'ffe4b5', location: location() }; }
  / 'Moccasin'             { return { term: 'color', value: 'ffe4b5', location: location() }; }
  / 'navajowhite'          { return { term: 'color', value: 'ffdead', location: location() }; }
  / 'NavajoWhite'          { return { term: 'color', value: 'ffdead', location: location() }; }
  / 'navy'                 { return { term: 'color', value: '000080', location: location() }; }
  / 'Navy'                 { return { term: 'color', value: '000080', location: location() }; }
  / 'oldlace'              { return { term: 'color', value: 'fdf5e6', location: location() }; }
  / 'OldLace'              { return { term: 'color', value: 'fdf5e6', location: location() }; }
  / 'olive'                { return { term: 'color', value: '808000', location: location() }; }
  / 'Olive'                { return { term: 'color', value: '808000', location: location() }; }
  / 'olivedrab'            { return { term: 'color', value: '6b8e23', location: location() }; }
  / 'OliveDrab'            { return { term: 'color', value: '6b8e23', location: location() }; }
  / 'orange'               { return { term: 'color', value: 'ffa500', location: location() }; }
  / 'Orange'               { return { term: 'color', value: 'ffa500', location: location() }; }
  / 'orangered'            { return { term: 'color', value: 'ff4500', location: location() }; }
  / 'OrangeRed'            { return { term: 'color', value: 'ff4500', location: location() }; }
  / 'orchid'               { return { term: 'color', value: 'da70d6', location: location() }; }
  / 'Orchid'               { return { term: 'color', value: 'da70d6', location: location() }; }
  / 'palegoldenrod'        { return { term: 'color', value: 'eee8aa', location: location() }; }
  / 'PaleGoldenRod'        { return { term: 'color', value: 'eee8aa', location: location() }; }
  / 'palegreen'            { return { term: 'color', value: '98fb98', location: location() }; }
  / 'PaleGreen'            { return { term: 'color', value: '98fb98', location: location() }; }
  / 'paleturquoise'        { return { term: 'color', value: 'afeeee', location: location() }; }
  / 'PaleTurquoise'        { return { term: 'color', value: 'afeeee', location: location() }; }
  / 'palevioletred'        { return { term: 'color', value: 'd87093', location: location() }; }
  / 'PaleVioletRed'        { return { term: 'color', value: 'd87093', location: location() }; }
  / 'papayawhip'           { return { term: 'color', value: 'ffefd5', location: location() }; }
  / 'PapayaWhip'           { return { term: 'color', value: 'ffefd5', location: location() }; }
  / 'peachpuff'            { return { term: 'color', value: 'ffdab9', location: location() }; }
  / 'PeachPuff'            { return { term: 'color', value: 'ffdab9', location: location() }; }
  / 'peru'                 { return { term: 'color', value: 'cd853f', location: location() }; }
  / 'Peru'                 { return { term: 'color', value: 'cd853f', location: location() }; }
  / 'pink'                 { return { term: 'color', value: 'ffc0cb', location: location() }; }
  / 'Pink'                 { return { term: 'color', value: 'ffc0cb', location: location() }; }
  / 'plum'                 { return { term: 'color', value: 'dda0dd', location: location() }; }
  / 'Plum'                 { return { term: 'color', value: 'dda0dd', location: location() }; }
  / 'powderblue'           { return { term: 'color', value: 'b0e0e6', location: location() }; }
  / 'PowderBlue'           { return { term: 'color', value: 'b0e0e6', location: location() }; }
  / 'purple'               { return { term: 'color', value: '800080', location: location() }; }
  / 'Purple'               { return { term: 'color', value: '800080', location: location() }; }
  / 'red'                  { return { term: 'color', value: 'ff0000', location: location() }; }
  / 'Red'                  { return { term: 'color', value: 'ff0000', location: location() }; }
  / 'rosybrown'            { return { term: 'color', value: 'bc8f8f', location: location() }; }
  / 'RosyBrown'            { return { term: 'color', value: 'bc8f8f', location: location() }; }
  / 'royalblue'            { return { term: 'color', value: '4169e1', location: location() }; }
  / 'RoyalBlue'            { return { term: 'color', value: '4169e1', location: location() }; }
  / 'saddlebrown'          { return { term: 'color', value: '8b4513', location: location() }; }
  / 'SaddleBrown'          { return { term: 'color', value: '8b4513', location: location() }; }
  / 'salmon'               { return { term: 'color', value: 'fa8072', location: location() }; }
  / 'Salmon'               { return { term: 'color', value: 'fa8072', location: location() }; }
  / 'sandybrown'           { return { term: 'color', value: 'f4a460', location: location() }; }
  / 'SandyBrown'           { return { term: 'color', value: 'f4a460', location: location() }; }
  / 'seagreen'             { return { term: 'color', value: '2e8b57', location: location() }; }
  / 'SeaGreen'             { return { term: 'color', value: '2e8b57', location: location() }; }
  / 'seashell'             { return { term: 'color', value: 'fff5ee', location: location() }; }
  / 'SeaShell'             { return { term: 'color', value: 'fff5ee', location: location() }; }
  / 'sienna'               { return { term: 'color', value: 'a0522d', location: location() }; }
  / 'Sienna'               { return { term: 'color', value: 'a0522d', location: location() }; }
  / 'silver'               { return { term: 'color', value: 'c0c0c0', location: location() }; }
  / 'Silver'               { return { term: 'color', value: 'c0c0c0', location: location() }; }
  / 'skyblue'              { return { term: 'color', value: '87ceeb', location: location() }; }
  / 'SkyBlue'              { return { term: 'color', value: '87ceeb', location: location() }; }
  / 'slateblue'            { return { term: 'color', value: '6a5acd', location: location() }; }
  / 'SlateBlue'            { return { term: 'color', value: '6a5acd', location: location() }; }
  / 'slategray'            { return { term: 'color', value: '708090', location: location() }; }
  / 'SlateGray'            { return { term: 'color', value: '708090', location: location() }; }
  / 'slategrey'            { return { term: 'color', value: '708090', location: location() }; }
  / 'SlateGrey'            { return { term: 'color', value: '708090', location: location() }; }
  / 'snow'                 { return { term: 'color', value: 'fffafa', location: location() }; }
  / 'Snow'                 { return { term: 'color', value: 'fffafa', location: location() }; }
  / 'springgreen'          { return { term: 'color', value: '00ff7f', location: location() }; }
  / 'SpringGreen'          { return { term: 'color', value: '00ff7f', location: location() }; }
  / 'steelblue'            { return { term: 'color', value: '4682b4', location: location() }; }
  / 'SteelBlue'            { return { term: 'color', value: '4682b4', location: location() }; }
  / 'tan'                  { return { term: 'color', value: 'd2b48c', location: location() }; }
  / 'Tan'                  { return { term: 'color', value: 'd2b48c', location: location() }; }
  / 'teal'                 { return { term: 'color', value: '008080', location: location() }; }
  / 'Teal'                 { return { term: 'color', value: '008080', location: location() }; }
  / 'thistle'              { return { term: 'color', value: 'd8bfd8', location: location() }; }
  / 'Thistle'              { return { term: 'color', value: 'd8bfd8', location: location() }; }
  / 'tomato'               { return { term: 'color', value: 'ff6347', location: location() }; }
  / 'Tomato'               { return { term: 'color', value: 'ff6347', location: location() }; }
  / 'turquoise'            { return { term: 'color', value: '40e0d0', location: location() }; }
  / 'Turquoise'            { return { term: 'color', value: '40e0d0', location: location() }; }
  / 'violet'               { return { term: 'color', value: 'ee82ee', location: location() }; }
  / 'Violet'               { return { term: 'color', value: 'ee82ee', location: location() }; }
  / 'wheat'                { return { term: 'color', value: 'f5deb3', location: location() }; }
  / 'Wheat'                { return { term: 'color', value: 'f5deb3', location: location() }; }
  / 'white'                { return { term: 'color', value: 'ffffff', location: location() }; }
  / 'White'                { return { term: 'color', value: 'ffffff', location: location() }; }
  / 'whitesmoke'           { return { term: 'color', value: 'f5f5f5', location: location() }; }
  / 'WhiteSmoke'           { return { term: 'color', value: 'f5f5f5', location: location() }; }
  / 'yellow'               { return { term: 'color', value: 'ffff00', location: location() }; }
  / 'Yellow'               { return { term: 'color', value: 'ffff00', location: location() }; }
  / 'yellowgreen'          { return { term: 'color', value: '9acd32', location: location() }; }
  / 'YellowGreen'          { return { term: 'color', value: '9acd32', location: location() }; }


Rgb3
  = '#' r:_HexDigit g:_HexDigit b:_HexDigit _WS? {
    return { term: 'color', value: `${r}${r}${g}${g}${b}${b}ff`, location: location() }; }

Rgb6
  = '#' r1:_HexDigit r2:_HexDigit g1:_HexDigit g2:_HexDigit b1:_HexDigit b2:_HexDigit _WS? {
    return { term: 'color', value: `${r1}${r2}${g1}${g2}${b1}${b2}ff`, location: location() }; }

Rgba4
  = '#' r:_HexDigit g:_HexDigit b:_HexDigit a:_HexDigit _WS? {
    return { term: 'color', value: `${r}${r}${g}${g}${b}${b}${a}${a}`, location: location() }; }

Rgba8
  = '#' r1:_HexDigit r2:_HexDigit g1:_HexDigit g2:_HexDigit b1:_HexDigit b2:_HexDigit a1:_HexDigit a2:_HexDigit _WS? {
    return { term: 'color', value: `${r1}${r2}${g1}${g2}${b1}${b2}${a1}${a2}`, location: location() }; }

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
  = term:ArrowItemKey _WS? ":" _WS? value:_Label _WS? ";" _WS? {
    return { term, value, location: location() };
  }

SingleEdgeColor "single edge color"
  = "edge_color" _WS? ":" _WS? value:Color _WS? ";" _WS? {
    return { term: 'single_edge_color', value, location: location() };
  }

ArrowItems
  = SingleEdgeColor
  / ArrowItem+

ArrowDesc
  = "{" _WS? items:ArrowItems? _WS? "}" { return items; }

ArrowProbability
  = value:NonNegNumber "%" {
    return { term: 'arrow_probability', value, location: location() };
  }



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
 = value:_ShapeList { return { term: 'shape', value, location: location() }; }


Stripe "stripe"
  = '+|' value:NonNegIntegerLiteral { return { key: 'stripe', value,                  location: location() }; }
  / '-|' value:NonNegIntegerLiteral { return { key: 'stripe', value: signflip(value), location: location() }; }

Cycle "cycle"
  = '+'  value:NonNegIntegerLiteral { return { key: 'cycle',  value,                  location: location() }; }
  / '-'  value:NonNegIntegerLiteral { return { key: 'cycle',  value: signflip(value), location: location() }; }


MachineConfigTransition "machine config for transitions"
  = "transition" _WS? ":" _WS? "{" _WS? value:ConfigTransitionItems* _WS? "};" _WS? {
    return { term: "machine_config_transition", value, location: location() };
  }





MachineConfigStartState "machine config for start states"
  = term:"start_state" _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term, value, location: location() };
  }

MachineConfigEndState "machine config for end states"
  = term:"end_state"   _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term, value, location: location() };
  }

MachineConfigState "machine config for states"
  = term:"state"       _WS? ":" _WS? "{" _WS? value:ConfigStateItems* _WS? "};" _WS? {
    return { term, value, location: location() };
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
  = term:_TransitionKey_HeadType _WS? ":" _WS? value:ArrowHead _WS? ";" _WS? {
    return { term, value, location: location() };
  }





_TransitionKey_Color
  = "edge_color"
  / "reverse_edge_color"


ConfigTransitionItem_Color
  = term:_TransitionKey_Color _WS? ":" _WS? value:Color _WS? ";" _WS? {
    return { term, value, location: location() };
  }





ConfigTransitionItems
  = ConfigTransitionItem_Color
  / ConfigTransitionItem_Head


_StateItemThingKey_Shape
  = "node_shape"

ConfigStateItemThings_Shape
/* todo value is missing whargarbl */
  = term:_StateItemThingKey_Shape _WS? ";" _WS? {
  	return { term, value, location: location() };
  }





_StateItemThingKey_Color
  = "node_color"
  / "node_border_color"

ConfigStateItemThings_Color
  = _StateItemThingKey_Color






ConfigStateItemThings
  = ConfigStateItemThings_Shape
  / ConfigStateItemThings_Color





ConfigStateItems
  = term:ConfigStateItemThings _WS? ":" _WS? value:_Label _WS? {
    return { term, value, location: location() };
  }





ConfigStateItemList
  = "{" _WS? value:ConfigStateItemEntry* _WS? "}" _WS? {
    return { term: "config_state_item_list", value, location: location() };
  }


_ArrowHeadList
 = "box"       / "lbox"       / "rbox"       / "obox"      / "olbox"     / "orbox"
 / "crow"      / "lcrow"      / "rcrow"      / "diamond"   / "ldiamond"  / "rdiamond"
 / "odiamond"  / "oldiamond"  / "ordiamond"  / "dot"       / "odot"      / "inv"
 / "linv"      / "rinv"       / "oinv"       / "olinv"     / "orinv"     / "none"
 / "normal"    / "lnormal"    / "rnormal"    / "onormal"   / "olnormal"  / "ornormal"
 / "tee"       / "ltee"       / "rtee"       / "vee"       / "lvee"      / "rvee"
 / "curve"     / "lcurve"     / "rcurve"     / "icurve"    / "licurve"   / "ricurve"





ArrowHead "shape"
 = value:_ArrowHeadList { return { term: 'arrow_head', value, location: location() }; }

ReverseArrowHead "shape"
 = value:_ArrowHeadList { return { term: 'arrow_tail', value, location: location() }; }


StateDeclaration "state declaration"
  = name:_Label _WS? ":" _WS? value:ConfigStateItemList _WS? ";" _WS? {
  	return { term: 'state_declaration', name, value, location: location() };
  }
