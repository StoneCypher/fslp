
// todo whargarbl turn this to 'foo'i style rules

NamedColor "named color"
  = 'aliceblue'            { return { term: 'color', value: 'f0f8ffff', location: location() }; }
  / 'AliceBlue'            { return { term: 'color', value: 'f0f8ffff', location: location() }; }
  / 'antiquewhite'         { return { term: 'color', value: 'faebd7ff', location: location() }; }
  / 'AntiqueWhite'         { return { term: 'color', value: 'faebd7ff', location: location() }; }
  / 'aqua'                 { return { term: 'color', value: '00ffffff', location: location() }; }
  / 'Aqua'                 { return { term: 'color', value: '00ffffff', location: location() }; }
  / 'aquamarine'           { return { term: 'color', value: '7fffd4ff', location: location() }; }
  / 'Aquamarine'           { return { term: 'color', value: '7fffd4ff', location: location() }; }
  / 'azure'                { return { term: 'color', value: 'f0ffffff', location: location() }; }
  / 'Azure'                { return { term: 'color', value: 'f0ffffff', location: location() }; }
  / 'beige'                { return { term: 'color', value: 'f5f5dcff', location: location() }; }
  / 'Beige'                { return { term: 'color', value: 'f5f5dcff', location: location() }; }
  / 'bisque'               { return { term: 'color', value: 'ffe4c4ff', location: location() }; }
  / 'Bisque'               { return { term: 'color', value: 'ffe4c4ff', location: location() }; }
  / 'black'                { return { term: 'color', value: '000000ff', location: location() }; }
  / 'Black'                { return { term: 'color', value: '000000ff', location: location() }; }
  / 'blanchedalmond'       { return { term: 'color', value: 'ffebcdff', location: location() }; }
  / 'BlanchedAlmond'       { return { term: 'color', value: 'ffebcdff', location: location() }; }
  / 'blue'                 { return { term: 'color', value: '0000ffff', location: location() }; }
  / 'Blue'                 { return { term: 'color', value: '0000ffff', location: location() }; }
  / 'blueviolet'           { return { term: 'color', value: '8a2be2ff', location: location() }; }
  / 'BlueViolet'           { return { term: 'color', value: '8a2be2ff', location: location() }; }
  / 'brown'                { return { term: 'color', value: 'a52a2aff', location: location() }; }
  / 'Brown'                { return { term: 'color', value: 'a52a2aff', location: location() }; }
  / 'burlywood'            { return { term: 'color', value: 'deb887ff', location: location() }; }
  / 'BurlyWood'            { return { term: 'color', value: 'deb887ff', location: location() }; }
  / 'cadetblue'            { return { term: 'color', value: '5f9ea0ff', location: location() }; }
  / 'CadetBlue'            { return { term: 'color', value: '5f9ea0ff', location: location() }; }
  / 'chartreuse'           { return { term: 'color', value: '7fff00ff', location: location() }; }
  / 'Chartreuse'           { return { term: 'color', value: '7fff00ff', location: location() }; }
  / 'chocolate'            { return { term: 'color', value: 'd2691eff', location: location() }; }
  / 'Chocolate'            { return { term: 'color', value: 'd2691eff', location: location() }; }
  / 'coral'                { return { term: 'color', value: 'ff7f50ff', location: location() }; }
  / 'Coral'                { return { term: 'color', value: 'ff7f50ff', location: location() }; }
  / 'cornflowerblue'       { return { term: 'color', value: '6495edff', location: location() }; }
  / 'CornflowerBlue'       { return { term: 'color', value: '6495edff', location: location() }; }
  / 'cornsilk'             { return { term: 'color', value: 'fff8dcff', location: location() }; }
  / 'Cornsilk'             { return { term: 'color', value: 'fff8dcff', location: location() }; }
  / 'crimson'              { return { term: 'color', value: 'dc143cff', location: location() }; }
  / 'Crimson'              { return { term: 'color', value: 'dc143cff', location: location() }; }
  / 'cyan'                 { return { term: 'color', value: '00ffffff', location: location() }; }
  / 'Cyan'                 { return { term: 'color', value: '00ffffff', location: location() }; }
  / 'darkblue'             { return { term: 'color', value: '00008bff', location: location() }; }
  / 'DarkBlue'             { return { term: 'color', value: '00008bff', location: location() }; }
  / 'darkcyan'             { return { term: 'color', value: '008b8bff', location: location() }; }
  / 'DarkCyan'             { return { term: 'color', value: '008b8bff', location: location() }; }
  / 'darkgoldenrod'        { return { term: 'color', value: 'b8860bff', location: location() }; }
  / 'DarkGoldenRod'        { return { term: 'color', value: 'b8860bff', location: location() }; }
  / 'darkgray'             { return { term: 'color', value: 'a9a9a9ff', location: location() }; }
  / 'DarkGray'             { return { term: 'color', value: 'a9a9a9ff', location: location() }; }
  / 'darkgrey'             { return { term: 'color', value: 'a9a9a9ff', location: location() }; }
  / 'DarkGrey'             { return { term: 'color', value: 'a9a9a9ff', location: location() }; }
  / 'darkgreen'            { return { term: 'color', value: '006400ff', location: location() }; }
  / 'DarkGreen'            { return { term: 'color', value: '006400ff', location: location() }; }
  / 'darkkhaki'            { return { term: 'color', value: 'bdb76bff', location: location() }; }
  / 'DarkKhaki'            { return { term: 'color', value: 'bdb76bff', location: location() }; }
  / 'darkmagenta'          { return { term: 'color', value: '8b008bff', location: location() }; }
  / 'DarkMagenta'          { return { term: 'color', value: '8b008bff', location: location() }; }
  / 'darkolivegreen'       { return { term: 'color', value: '556b2fff', location: location() }; }
  / 'DarkOliveGreen'       { return { term: 'color', value: '556b2fff', location: location() }; }
  / 'darkorange'           { return { term: 'color', value: 'ff8c00ff', location: location() }; }
  / 'Darkorange'           { return { term: 'color', value: 'ff8c00ff', location: location() }; }
  / 'darkorchid'           { return { term: 'color', value: '9932ccff', location: location() }; }
  / 'DarkOrchid'           { return { term: 'color', value: '9932ccff', location: location() }; }
  / 'darkred'              { return { term: 'color', value: '8b0000ff', location: location() }; }
  / 'DarkRed'              { return { term: 'color', value: '8b0000ff', location: location() }; }
  / 'darksalmon'           { return { term: 'color', value: 'e9967aff', location: location() }; }
  / 'DarkSalmon'           { return { term: 'color', value: 'e9967aff', location: location() }; }
  / 'darkseagreen'         { return { term: 'color', value: '8fbc8fff', location: location() }; }
  / 'DarkSeaGreen'         { return { term: 'color', value: '8fbc8fff', location: location() }; }
  / 'darkslateblue'        { return { term: 'color', value: '483d8bff', location: location() }; }
  / 'DarkSlateBlue'        { return { term: 'color', value: '483d8bff', location: location() }; }
  / 'darkslategray'        { return { term: 'color', value: '2f4f4fff', location: location() }; }
  / 'DarkSlateGray'        { return { term: 'color', value: '2f4f4fff', location: location() }; }
  / 'darkslategrey'        { return { term: 'color', value: '2f4f4fff', location: location() }; }
  / 'DarkSlateGrey'        { return { term: 'color', value: '2f4f4fff', location: location() }; }
  / 'darkturquoise'        { return { term: 'color', value: '00ced1ff', location: location() }; }
  / 'DarkTurquoise'        { return { term: 'color', value: '00ced1ff', location: location() }; }
  / 'darkviolet'           { return { term: 'color', value: '9400d3ff', location: location() }; }
  / 'DarkViolet'           { return { term: 'color', value: '9400d3ff', location: location() }; }
  / 'deeppink'             { return { term: 'color', value: 'ff1493ff', location: location() }; }
  / 'DeepPink'             { return { term: 'color', value: 'ff1493ff', location: location() }; }
  / 'deepskyblue'          { return { term: 'color', value: '00bfffff', location: location() }; }
  / 'DeepSkyBlue'          { return { term: 'color', value: '00bfffff', location: location() }; }
  / 'dimgray'              { return { term: 'color', value: '696969ff', location: location() }; }
  / 'DimGray'              { return { term: 'color', value: '696969ff', location: location() }; }
  / 'dimgrey'              { return { term: 'color', value: '696969ff', location: location() }; }
  / 'DimGrey'              { return { term: 'color', value: '696969ff', location: location() }; }
  / 'dodgerblue'           { return { term: 'color', value: '1e90ffff', location: location() }; }
  / 'DodgerBlue'           { return { term: 'color', value: '1e90ffff', location: location() }; }
  / 'firebrick'            { return { term: 'color', value: 'b22222ff', location: location() }; }
  / 'FireBrick'            { return { term: 'color', value: 'b22222ff', location: location() }; }
  / 'floralwhite'          { return { term: 'color', value: 'fffaf0ff', location: location() }; }
  / 'FloralWhite'          { return { term: 'color', value: 'fffaf0ff', location: location() }; }
  / 'forestgreen'          { return { term: 'color', value: '228b22ff', location: location() }; }
  / 'ForestGreen'          { return { term: 'color', value: '228b22ff', location: location() }; }
  / 'fuchsia'              { return { term: 'color', value: 'ff00ffff', location: location() }; }
  / 'Fuchsia'              { return { term: 'color', value: 'ff00ffff', location: location() }; }
  / 'gainsboro'            { return { term: 'color', value: 'dcdcdcff', location: location() }; }
  / 'Gainsboro'            { return { term: 'color', value: 'dcdcdcff', location: location() }; }
  / 'ghostwhite'           { return { term: 'color', value: 'f8f8ffff', location: location() }; }
  / 'GhostWhite'           { return { term: 'color', value: 'f8f8ffff', location: location() }; }
  / 'gold'                 { return { term: 'color', value: 'ffd700ff', location: location() }; }
  / 'Gold'                 { return { term: 'color', value: 'ffd700ff', location: location() }; }
  / 'goldenrod'            { return { term: 'color', value: 'daa520ff', location: location() }; }
  / 'GoldenRod'            { return { term: 'color', value: 'daa520ff', location: location() }; }
  / 'gray'                 { return { term: 'color', value: '808080ff', location: location() }; }
  / 'Gray'                 { return { term: 'color', value: '808080ff', location: location() }; }
  / 'grey'                 { return { term: 'color', value: '808080ff', location: location() }; }
  / 'Grey'                 { return { term: 'color', value: '808080ff', location: location() }; }
  / 'green'                { return { term: 'color', value: '008000ff', location: location() }; }
  / 'Green'                { return { term: 'color', value: '008000ff', location: location() }; }
  / 'greenyellow'          { return { term: 'color', value: 'adff2fff', location: location() }; }
  / 'GreenYellow'          { return { term: 'color', value: 'adff2fff', location: location() }; }
  / 'honeydew'             { return { term: 'color', value: 'f0fff0ff', location: location() }; }
  / 'HoneyDew'             { return { term: 'color', value: 'f0fff0ff', location: location() }; }
  / 'hotpink'              { return { term: 'color', value: 'ff69b4ff', location: location() }; }
  / 'HotPink'              { return { term: 'color', value: 'ff69b4ff', location: location() }; }
  / 'indianred'            { return { term: 'color', value: 'cd5c5cff', location: location() }; }
  / 'IndianRed'            { return { term: 'color', value: 'cd5c5cff', location: location() }; }
  / 'indigo'               { return { term: 'color', value: '4b0082ff', location: location() }; }
  / 'Indigo'               { return { term: 'color', value: '4b0082ff', location: location() }; }
  / 'ivory'                { return { term: 'color', value: 'fffff0ff', location: location() }; }
  / 'Ivory'                { return { term: 'color', value: 'fffff0ff', location: location() }; }
  / 'khaki'                { return { term: 'color', value: 'f0e68cff', location: location() }; }
  / 'Khaki'                { return { term: 'color', value: 'f0e68cff', location: location() }; }
  / 'lavender'             { return { term: 'color', value: 'e6e6faff', location: location() }; }
  / 'Lavender'             { return { term: 'color', value: 'e6e6faff', location: location() }; }
  / 'lavenderblush'        { return { term: 'color', value: 'fff0f5ff', location: location() }; }
  / 'LavenderBlush'        { return { term: 'color', value: 'fff0f5ff', location: location() }; }
  / 'lawngreen'            { return { term: 'color', value: '7cfc00ff', location: location() }; }
  / 'LawnGreen'            { return { term: 'color', value: '7cfc00ff', location: location() }; }
  / 'lemonchiffon'         { return { term: 'color', value: 'fffacdff', location: location() }; }
  / 'LemonChiffon'         { return { term: 'color', value: 'fffacdff', location: location() }; }
  / 'lightblue'            { return { term: 'color', value: 'add8e6ff', location: location() }; }
  / 'LightBlue'            { return { term: 'color', value: 'add8e6ff', location: location() }; }
  / 'lightcoral'           { return { term: 'color', value: 'f08080ff', location: location() }; }
  / 'LightCoral'           { return { term: 'color', value: 'f08080ff', location: location() }; }
  / 'lightcyan'            { return { term: 'color', value: 'e0ffffff', location: location() }; }
  / 'LightCyan'            { return { term: 'color', value: 'e0ffffff', location: location() }; }
  / 'lightgoldenrodyellow' { return { term: 'color', value: 'fafad2ff', location: location() }; }
  / 'LightGoldenRodYellow' { return { term: 'color', value: 'fafad2ff', location: location() }; }
  / 'lightgray'            { return { term: 'color', value: 'd3d3d3ff', location: location() }; }
  / 'LightGray'            { return { term: 'color', value: 'd3d3d3ff', location: location() }; }
  / 'lightgrey'            { return { term: 'color', value: 'd3d3d3ff', location: location() }; }
  / 'LightGrey'            { return { term: 'color', value: 'd3d3d3ff', location: location() }; }
  / 'lightgreen'           { return { term: 'color', value: '90ee90ff', location: location() }; }
  / 'LightGreen'           { return { term: 'color', value: '90ee90ff', location: location() }; }
  / 'lightpink'            { return { term: 'color', value: 'ffb6c1ff', location: location() }; }
  / 'LightPink'            { return { term: 'color', value: 'ffb6c1ff', location: location() }; }
  / 'lightsalmon'          { return { term: 'color', value: 'ffa07aff', location: location() }; }
  / 'LightSalmon'          { return { term: 'color', value: 'ffa07aff', location: location() }; }
  / 'lightseagreen'        { return { term: 'color', value: '20b2aaff', location: location() }; }
  / 'LightSeaGreen'        { return { term: 'color', value: '20b2aaff', location: location() }; }
  / 'lightskyblue'         { return { term: 'color', value: '87cefaff', location: location() }; }
  / 'LightSkyBlue'         { return { term: 'color', value: '87cefaff', location: location() }; }
  / 'lightslategray'       { return { term: 'color', value: '778899ff', location: location() }; }
  / 'LightSlateGray'       { return { term: 'color', value: '778899ff', location: location() }; }
  / 'lightslategrey'       { return { term: 'color', value: '778899ff', location: location() }; }
  / 'LightSlateGrey'       { return { term: 'color', value: '778899ff', location: location() }; }
  / 'lightsteelblue'       { return { term: 'color', value: 'b0c4deff', location: location() }; }
  / 'LightSteelBlue'       { return { term: 'color', value: 'b0c4deff', location: location() }; }
  / 'lightyellow'          { return { term: 'color', value: 'ffffe0ff', location: location() }; }
  / 'LightYellow'          { return { term: 'color', value: 'ffffe0ff', location: location() }; }
  / 'lime'                 { return { term: 'color', value: '00ff00ff', location: location() }; }
  / 'Lime'                 { return { term: 'color', value: '00ff00ff', location: location() }; }
  / 'limegreen'            { return { term: 'color', value: '32cd32ff', location: location() }; }
  / 'LimeGreen'            { return { term: 'color', value: '32cd32ff', location: location() }; }
  / 'linen'                { return { term: 'color', value: 'faf0e6ff', location: location() }; }
  / 'Linen'                { return { term: 'color', value: 'faf0e6ff', location: location() }; }
  / 'magenta'              { return { term: 'color', value: 'ff00ffff', location: location() }; }
  / 'Magenta'              { return { term: 'color', value: 'ff00ffff', location: location() }; }
  / 'maroon'               { return { term: 'color', value: '800000ff', location: location() }; }
  / 'Maroon'               { return { term: 'color', value: '800000ff', location: location() }; }
  / 'mediumaquamarine'     { return { term: 'color', value: '66cdaaff', location: location() }; }
  / 'MediumAquaMarine'     { return { term: 'color', value: '66cdaaff', location: location() }; }
  / 'mediumblue'           { return { term: 'color', value: '0000cdff', location: location() }; }
  / 'MediumBlue'           { return { term: 'color', value: '0000cdff', location: location() }; }
  / 'mediumorchid'         { return { term: 'color', value: 'ba55d3ff', location: location() }; }
  / 'MediumOrchid'         { return { term: 'color', value: 'ba55d3ff', location: location() }; }
  / 'mediumpurple'         { return { term: 'color', value: '9370d8ff', location: location() }; }
  / 'MediumPurple'         { return { term: 'color', value: '9370d8ff', location: location() }; }
  / 'mediumseagreen'       { return { term: 'color', value: '3cb371ff', location: location() }; }
  / 'MediumSeaGreen'       { return { term: 'color', value: '3cb371ff', location: location() }; }
  / 'mediumslateblue'      { return { term: 'color', value: '7b68eeff', location: location() }; }
  / 'MediumSlateBlue'      { return { term: 'color', value: '7b68eeff', location: location() }; }
  / 'mediumspringgreen'    { return { term: 'color', value: '00fa9aff', location: location() }; }
  / 'MediumSpringGreen'    { return { term: 'color', value: '00fa9aff', location: location() }; }
  / 'mediumturquoise'      { return { term: 'color', value: '48d1ccff', location: location() }; }
  / 'MediumTurquoise'      { return { term: 'color', value: '48d1ccff', location: location() }; }
  / 'mediumvioletred'      { return { term: 'color', value: 'c71585ff', location: location() }; }
  / 'MediumVioletRed'      { return { term: 'color', value: 'c71585ff', location: location() }; }
  / 'midnightblue'         { return { term: 'color', value: '191970ff', location: location() }; }
  / 'MidnightBlue'         { return { term: 'color', value: '191970ff', location: location() }; }
  / 'mintcream'            { return { term: 'color', value: 'f5fffaff', location: location() }; }
  / 'MintCream'            { return { term: 'color', value: 'f5fffaff', location: location() }; }
  / 'mistyrose'            { return { term: 'color', value: 'ffe4e1ff', location: location() }; }
  / 'MistyRose'            { return { term: 'color', value: 'ffe4e1ff', location: location() }; }
  / 'moccasin'             { return { term: 'color', value: 'ffe4b5ff', location: location() }; }
  / 'Moccasin'             { return { term: 'color', value: 'ffe4b5ff', location: location() }; }
  / 'navajowhite'          { return { term: 'color', value: 'ffdeadff', location: location() }; }
  / 'NavajoWhite'          { return { term: 'color', value: 'ffdeadff', location: location() }; }
  / 'navy'                 { return { term: 'color', value: '000080ff', location: location() }; }
  / 'Navy'                 { return { term: 'color', value: '000080ff', location: location() }; }
  / 'oldlace'              { return { term: 'color', value: 'fdf5e6ff', location: location() }; }
  / 'OldLace'              { return { term: 'color', value: 'fdf5e6ff', location: location() }; }
  / 'olive'                { return { term: 'color', value: '808000ff', location: location() }; }
  / 'Olive'                { return { term: 'color', value: '808000ff', location: location() }; }
  / 'olivedrab'            { return { term: 'color', value: '6b8e23ff', location: location() }; }
  / 'OliveDrab'            { return { term: 'color', value: '6b8e23ff', location: location() }; }
  / 'orange'               { return { term: 'color', value: 'ffa500ff', location: location() }; }
  / 'Orange'               { return { term: 'color', value: 'ffa500ff', location: location() }; }
  / 'orangered'            { return { term: 'color', value: 'ff4500ff', location: location() }; }
  / 'OrangeRed'            { return { term: 'color', value: 'ff4500ff', location: location() }; }
  / 'orchid'               { return { term: 'color', value: 'da70d6ff', location: location() }; }
  / 'Orchid'               { return { term: 'color', value: 'da70d6ff', location: location() }; }
  / 'palegoldenrod'        { return { term: 'color', value: 'eee8aaff', location: location() }; }
  / 'PaleGoldenRod'        { return { term: 'color', value: 'eee8aaff', location: location() }; }
  / 'palegreen'            { return { term: 'color', value: '98fb98ff', location: location() }; }
  / 'PaleGreen'            { return { term: 'color', value: '98fb98ff', location: location() }; }
  / 'paleturquoise'        { return { term: 'color', value: 'afeeeeff', location: location() }; }
  / 'PaleTurquoise'        { return { term: 'color', value: 'afeeeeff', location: location() }; }
  / 'palevioletred'        { return { term: 'color', value: 'd87093ff', location: location() }; }
  / 'PaleVioletRed'        { return { term: 'color', value: 'd87093ff', location: location() }; }
  / 'papayawhip'           { return { term: 'color', value: 'ffefd5ff', location: location() }; }
  / 'PapayaWhip'           { return { term: 'color', value: 'ffefd5ff', location: location() }; }
  / 'peachpuff'            { return { term: 'color', value: 'ffdab9ff', location: location() }; }
  / 'PeachPuff'            { return { term: 'color', value: 'ffdab9ff', location: location() }; }
  / 'peru'                 { return { term: 'color', value: 'cd853fff', location: location() }; }
  / 'Peru'                 { return { term: 'color', value: 'cd853fff', location: location() }; }
  / 'pink'                 { return { term: 'color', value: 'ffc0cbff', location: location() }; }
  / 'Pink'                 { return { term: 'color', value: 'ffc0cbff', location: location() }; }
  / 'plum'                 { return { term: 'color', value: 'dda0ddff', location: location() }; }
  / 'Plum'                 { return { term: 'color', value: 'dda0ddff', location: location() }; }
  / 'powderblue'           { return { term: 'color', value: 'b0e0e6ff', location: location() }; }
  / 'PowderBlue'           { return { term: 'color', value: 'b0e0e6ff', location: location() }; }
  / 'purple'               { return { term: 'color', value: '800080ff', location: location() }; }
  / 'Purple'               { return { term: 'color', value: '800080ff', location: location() }; }
  / 'red'                  { return { term: 'color', value: 'ff0000ff', location: location() }; }
  / 'Red'                  { return { term: 'color', value: 'ff0000ff', location: location() }; }
  / 'rosybrown'            { return { term: 'color', value: 'bc8f8fff', location: location() }; }
  / 'RosyBrown'            { return { term: 'color', value: 'bc8f8fff', location: location() }; }
  / 'royalblue'            { return { term: 'color', value: '4169e1ff', location: location() }; }
  / 'RoyalBlue'            { return { term: 'color', value: '4169e1ff', location: location() }; }
  / 'saddlebrown'          { return { term: 'color', value: '8b4513ff', location: location() }; }
  / 'SaddleBrown'          { return { term: 'color', value: '8b4513ff', location: location() }; }
  / 'salmon'               { return { term: 'color', value: 'fa8072ff', location: location() }; }
  / 'Salmon'               { return { term: 'color', value: 'fa8072ff', location: location() }; }
  / 'sandybrown'           { return { term: 'color', value: 'f4a460ff', location: location() }; }
  / 'SandyBrown'           { return { term: 'color', value: 'f4a460ff', location: location() }; }
  / 'seagreen'             { return { term: 'color', value: '2e8b57ff', location: location() }; }
  / 'SeaGreen'             { return { term: 'color', value: '2e8b57ff', location: location() }; }
  / 'seashell'             { return { term: 'color', value: 'fff5eeff', location: location() }; }
  / 'SeaShell'             { return { term: 'color', value: 'fff5eeff', location: location() }; }
  / 'sienna'               { return { term: 'color', value: 'a0522dff', location: location() }; }
  / 'Sienna'               { return { term: 'color', value: 'a0522dff', location: location() }; }
  / 'silver'               { return { term: 'color', value: 'c0c0c0ff', location: location() }; }
  / 'Silver'               { return { term: 'color', value: 'c0c0c0ff', location: location() }; }
  / 'skyblue'              { return { term: 'color', value: '87ceebff', location: location() }; }
  / 'SkyBlue'              { return { term: 'color', value: '87ceebff', location: location() }; }
  / 'slateblue'            { return { term: 'color', value: '6a5acdff', location: location() }; }
  / 'SlateBlue'            { return { term: 'color', value: '6a5acdff', location: location() }; }
  / 'slategray'            { return { term: 'color', value: '708090ff', location: location() }; }
  / 'SlateGray'            { return { term: 'color', value: '708090ff', location: location() }; }
  / 'slategrey'            { return { term: 'color', value: '708090ff', location: location() }; }
  / 'SlateGrey'            { return { term: 'color', value: '708090ff', location: location() }; }
  / 'snow'                 { return { term: 'color', value: 'fffafaff', location: location() }; }
  / 'Snow'                 { return { term: 'color', value: 'fffafaff', location: location() }; }
  / 'springgreen'          { return { term: 'color', value: '00ff7fff', location: location() }; }
  / 'SpringGreen'          { return { term: 'color', value: '00ff7fff', location: location() }; }
  / 'steelblue'            { return { term: 'color', value: '4682b4ff', location: location() }; }
  / 'SteelBlue'            { return { term: 'color', value: '4682b4ff', location: location() }; }
  / 'tan'                  { return { term: 'color', value: 'd2b48cff', location: location() }; }
  / 'Tan'                  { return { term: 'color', value: 'd2b48cff', location: location() }; }
  / 'teal'                 { return { term: 'color', value: '008080ff', location: location() }; }
  / 'Teal'                 { return { term: 'color', value: '008080ff', location: location() }; }
  / 'thistle'              { return { term: 'color', value: 'd8bfd8ff', location: location() }; }
  / 'Thistle'              { return { term: 'color', value: 'd8bfd8ff', location: location() }; }
  / 'tomato'               { return { term: 'color', value: 'ff6347ff', location: location() }; }
  / 'Tomato'               { return { term: 'color', value: 'ff6347ff', location: location() }; }
  / 'turquoise'            { return { term: 'color', value: '40e0d0ff', location: location() }; }
  / 'Turquoise'            { return { term: 'color', value: '40e0d0ff', location: location() }; }
  / 'violet'               { return { term: 'color', value: 'ee82eeff', location: location() }; }
  / 'Violet'               { return { term: 'color', value: 'ee82eeff', location: location() }; }
  / 'wheat'                { return { term: 'color', value: 'f5deb3ff', location: location() }; }
  / 'Wheat'                { return { term: 'color', value: 'f5deb3ff', location: location() }; }
  / 'white'                { return { term: 'color', value: 'ffffffff', location: location() }; }
  / 'White'                { return { term: 'color', value: 'ffffffff', location: location() }; }
  / 'whitesmoke'           { return { term: 'color', value: 'f5f5f5ff', location: location() }; }
  / 'WhiteSmoke'           { return { term: 'color', value: 'f5f5f5ff', location: location() }; }
  / 'yellow'               { return { term: 'color', value: 'ffff00ff', location: location() }; }
  / 'Yellow'               { return { term: 'color', value: 'ffff00ff', location: location() }; }
  / 'yellowgreen'          { return { term: 'color', value: '9acd32ff', location: location() }; }
  / 'YellowGreen'          { return { term: 'color', value: '9acd32ff', location: location() }; }
