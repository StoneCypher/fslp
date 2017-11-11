
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
