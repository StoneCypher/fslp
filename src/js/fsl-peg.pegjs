
Document
  = Arrow
  / Shape
  / NamedColor


NamedColor "named color"
  = 'aliceblue'            { return { term: 'Color', value: 'f0f8ff', location: location() }; }
  / 'AliceBlue'            { return { term: 'Color', value: 'f0f8ff', location: location() }; }
  / 'antiquewhite'         { return { term: 'Color', value: 'faebd7', location: location() }; }
  / 'AntiqueWhite'         { return { term: 'Color', value: 'faebd7', location: location() }; }
  / 'aqua'                 { return { term: 'Color', value: '00ffff', location: location() }; }
  / 'Aqua'                 { return { term: 'Color', value: '00ffff', location: location() }; }
  / 'aquamarine'           { return { term: 'Color', value: '7fffd4', location: location() }; }
  / 'Aquamarine'           { return { term: 'Color', value: '7fffd4', location: location() }; }
  / 'azure'                { return { term: 'Color', value: 'f0ffff', location: location() }; }
  / 'Azure'                { return { term: 'Color', value: 'f0ffff', location: location() }; }
  / 'beige'                { return { term: 'Color', value: 'f5f5dc', location: location() }; }
  / 'Beige'                { return { term: 'Color', value: 'f5f5dc', location: location() }; }
  / 'bisque'               { return { term: 'Color', value: 'ffe4c4', location: location() }; }
  / 'Bisque'               { return { term: 'Color', value: 'ffe4c4', location: location() }; }
  / 'black'                { return { term: 'Color', value: '000000', location: location() }; }
  / 'Black'                { return { term: 'Color', value: '000000', location: location() }; }
  / 'blanchedalmond'       { return { term: 'Color', value: 'ffebcd', location: location() }; }
  / 'BlanchedAlmond'       { return { term: 'Color', value: 'ffebcd', location: location() }; }
  / 'blue'                 { return { term: 'Color', value: '0000ff', location: location() }; }
  / 'Blue'                 { return { term: 'Color', value: '0000ff', location: location() }; }
  / 'blueviolet'           { return { term: 'Color', value: '8a2be2', location: location() }; }
  / 'BlueViolet'           { return { term: 'Color', value: '8a2be2', location: location() }; }
  / 'brown'                { return { term: 'Color', value: 'a52a2a', location: location() }; }
  / 'Brown'                { return { term: 'Color', value: 'a52a2a', location: location() }; }
  / 'burlywood'            { return { term: 'Color', value: 'deb887', location: location() }; }
  / 'BurlyWood'            { return { term: 'Color', value: 'deb887', location: location() }; }
  / 'cadetblue'            { return { term: 'Color', value: '5f9ea0', location: location() }; }
  / 'CadetBlue'            { return { term: 'Color', value: '5f9ea0', location: location() }; }
  / 'chartreuse'           { return { term: 'Color', value: '7fff00', location: location() }; }
  / 'Chartreuse'           { return { term: 'Color', value: '7fff00', location: location() }; }
  / 'chocolate'            { return { term: 'Color', value: 'd2691e', location: location() }; }
  / 'Chocolate'            { return { term: 'Color', value: 'd2691e', location: location() }; }
  / 'coral'                { return { term: 'Color', value: 'ff7f50', location: location() }; }
  / 'Coral'                { return { term: 'Color', value: 'ff7f50', location: location() }; }
  / 'cornflowerblue'       { return { term: 'Color', value: '6495ed', location: location() }; }
  / 'CornflowerBlue'       { return { term: 'Color', value: '6495ed', location: location() }; }
  / 'cornsilk'             { return { term: 'Color', value: 'fff8dc', location: location() }; }
  / 'Cornsilk'             { return { term: 'Color', value: 'fff8dc', location: location() }; }
  / 'crimson'              { return { term: 'Color', value: 'dc143c', location: location() }; }
  / 'Crimson'              { return { term: 'Color', value: 'dc143c', location: location() }; }
  / 'cyan'                 { return { term: 'Color', value: '00ffff', location: location() }; }
  / 'Cyan'                 { return { term: 'Color', value: '00ffff', location: location() }; }
  / 'darkblue'             { return { term: 'Color', value: '00008b', location: location() }; }
  / 'DarkBlue'             { return { term: 'Color', value: '00008b', location: location() }; }
  / 'darkcyan'             { return { term: 'Color', value: '008b8b', location: location() }; }
  / 'DarkCyan'             { return { term: 'Color', value: '008b8b', location: location() }; }
  / 'darkgoldenrod'        { return { term: 'Color', value: 'b8860b', location: location() }; }
  / 'DarkGoldenRod'        { return { term: 'Color', value: 'b8860b', location: location() }; }
  / 'darkgray'             { return { term: 'Color', value: 'a9a9a9', location: location() }; }
  / 'DarkGray'             { return { term: 'Color', value: 'a9a9a9', location: location() }; }
  / 'darkgrey'             { return { term: 'Color', value: 'a9a9a9', location: location() }; }
  / 'DarkGrey'             { return { term: 'Color', value: 'a9a9a9', location: location() }; }
  / 'darkgreen'            { return { term: 'Color', value: '006400', location: location() }; }
  / 'DarkGreen'            { return { term: 'Color', value: '006400', location: location() }; }
  / 'darkkhaki'            { return { term: 'Color', value: 'bdb76b', location: location() }; }
  / 'DarkKhaki'            { return { term: 'Color', value: 'bdb76b', location: location() }; }
  / 'darkmagenta'          { return { term: 'Color', value: '8b008b', location: location() }; }
  / 'DarkMagenta'          { return { term: 'Color', value: '8b008b', location: location() }; }
  / 'darkolivegreen'       { return { term: 'Color', value: '556b2f', location: location() }; }
  / 'DarkOliveGreen'       { return { term: 'Color', value: '556b2f', location: location() }; }
  / 'darkorange'           { return { term: 'Color', value: 'ff8c00', location: location() }; }
  / 'Darkorange'           { return { term: 'Color', value: 'ff8c00', location: location() }; }
  / 'darkorchid'           { return { term: 'Color', value: '9932cc', location: location() }; }
  / 'DarkOrchid'           { return { term: 'Color', value: '9932cc', location: location() }; }
  / 'darkred'              { return { term: 'Color', value: '8b0000', location: location() }; }
  / 'DarkRed'              { return { term: 'Color', value: '8b0000', location: location() }; }
  / 'darksalmon'           { return { term: 'Color', value: 'e9967a', location: location() }; }
  / 'DarkSalmon'           { return { term: 'Color', value: 'e9967a', location: location() }; }
  / 'darkseagreen'         { return { term: 'Color', value: '8fbc8f', location: location() }; }
  / 'DarkSeaGreen'         { return { term: 'Color', value: '8fbc8f', location: location() }; }
  / 'darkslateblue'        { return { term: 'Color', value: '483d8b', location: location() }; }
  / 'DarkSlateBlue'        { return { term: 'Color', value: '483d8b', location: location() }; }
  / 'darkslategray'        { return { term: 'Color', value: '2f4f4f', location: location() }; }
  / 'DarkSlateGray'        { return { term: 'Color', value: '2f4f4f', location: location() }; }
  / 'darkslategrey'        { return { term: 'Color', value: '2f4f4f', location: location() }; }
  / 'DarkSlateGrey'        { return { term: 'Color', value: '2f4f4f', location: location() }; }
  / 'darkturquoise'        { return { term: 'Color', value: '00ced1', location: location() }; }
  / 'DarkTurquoise'        { return { term: 'Color', value: '00ced1', location: location() }; }
  / 'darkviolet'           { return { term: 'Color', value: '9400d3', location: location() }; }
  / 'DarkViolet'           { return { term: 'Color', value: '9400d3', location: location() }; }
  / 'deeppink'             { return { term: 'Color', value: 'ff1493', location: location() }; }
  / 'DeepPink'             { return { term: 'Color', value: 'ff1493', location: location() }; }
  / 'deepskyblue'          { return { term: 'Color', value: '00bfff', location: location() }; }
  / 'DeepSkyBlue'          { return { term: 'Color', value: '00bfff', location: location() }; }
  / 'dimgray'              { return { term: 'Color', value: '696969', location: location() }; }
  / 'DimGray'              { return { term: 'Color', value: '696969', location: location() }; }
  / 'dimgrey'              { return { term: 'Color', value: '696969', location: location() }; }
  / 'DimGrey'              { return { term: 'Color', value: '696969', location: location() }; }
  / 'dodgerblue'           { return { term: 'Color', value: '1e90ff', location: location() }; }
  / 'DodgerBlue'           { return { term: 'Color', value: '1e90ff', location: location() }; }
  / 'firebrick'            { return { term: 'Color', value: 'b22222', location: location() }; }
  / 'FireBrick'            { return { term: 'Color', value: 'b22222', location: location() }; }
  / 'floralwhite'          { return { term: 'Color', value: 'fffaf0', location: location() }; }
  / 'FloralWhite'          { return { term: 'Color', value: 'fffaf0', location: location() }; }
  / 'forestgreen'          { return { term: 'Color', value: '228b22', location: location() }; }
  / 'ForestGreen'          { return { term: 'Color', value: '228b22', location: location() }; }
  / 'fuchsia'              { return { term: 'Color', value: 'ff00ff', location: location() }; }
  / 'Fuchsia'              { return { term: 'Color', value: 'ff00ff', location: location() }; }
  / 'gainsboro'            { return { term: 'Color', value: 'dcdcdc', location: location() }; }
  / 'Gainsboro'            { return { term: 'Color', value: 'dcdcdc', location: location() }; }
  / 'ghostwhite'           { return { term: 'Color', value: 'f8f8ff', location: location() }; }
  / 'GhostWhite'           { return { term: 'Color', value: 'f8f8ff', location: location() }; }
  / 'gold'                 { return { term: 'Color', value: 'ffd700', location: location() }; }
  / 'Gold'                 { return { term: 'Color', value: 'ffd700', location: location() }; }
  / 'goldenrod'            { return { term: 'Color', value: 'daa520', location: location() }; }
  / 'GoldenRod'            { return { term: 'Color', value: 'daa520', location: location() }; }
  / 'gray'                 { return { term: 'Color', value: '808080', location: location() }; }
  / 'Gray'                 { return { term: 'Color', value: '808080', location: location() }; }
  / 'grey'                 { return { term: 'Color', value: '808080', location: location() }; }
  / 'Grey'                 { return { term: 'Color', value: '808080', location: location() }; }
  / 'green'                { return { term: 'Color', value: '008000', location: location() }; }
  / 'Green'                { return { term: 'Color', value: '008000', location: location() }; }
  / 'greenyellow'          { return { term: 'Color', value: 'adff2f', location: location() }; }
  / 'GreenYellow'          { return { term: 'Color', value: 'adff2f', location: location() }; }
  / 'honeydew'             { return { term: 'Color', value: 'f0fff0', location: location() }; }
  / 'HoneyDew'             { return { term: 'Color', value: 'f0fff0', location: location() }; }
  / 'hotpink'              { return { term: 'Color', value: 'ff69b4', location: location() }; }
  / 'HotPink'              { return { term: 'Color', value: 'ff69b4', location: location() }; }
  / 'indianred'            { return { term: 'Color', value: 'cd5c5c', location: location() }; }
  / 'IndianRed'            { return { term: 'Color', value: 'cd5c5c', location: location() }; }
  / 'indigo'               { return { term: 'Color', value: '4b0082', location: location() }; }
  / 'Indigo'               { return { term: 'Color', value: '4b0082', location: location() }; }
  / 'ivory'                { return { term: 'Color', value: 'fffff0', location: location() }; }
  / 'Ivory'                { return { term: 'Color', value: 'fffff0', location: location() }; }
  / 'khaki'                { return { term: 'Color', value: 'f0e68c', location: location() }; }
  / 'Khaki'                { return { term: 'Color', value: 'f0e68c', location: location() }; }
  / 'lavender'             { return { term: 'Color', value: 'e6e6fa', location: location() }; }
  / 'Lavender'             { return { term: 'Color', value: 'e6e6fa', location: location() }; }
  / 'lavenderblush'        { return { term: 'Color', value: 'fff0f5', location: location() }; }
  / 'LavenderBlush'        { return { term: 'Color', value: 'fff0f5', location: location() }; }
  / 'lawngreen'            { return { term: 'Color', value: '7cfc00', location: location() }; }
  / 'LawnGreen'            { return { term: 'Color', value: '7cfc00', location: location() }; }
  / 'lemonchiffon'         { return { term: 'Color', value: 'fffacd', location: location() }; }
  / 'LemonChiffon'         { return { term: 'Color', value: 'fffacd', location: location() }; }
  / 'lightblue'            { return { term: 'Color', value: 'add8e6', location: location() }; }
  / 'LightBlue'            { return { term: 'Color', value: 'add8e6', location: location() }; }
  / 'lightcoral'           { return { term: 'Color', value: 'f08080', location: location() }; }
  / 'LightCoral'           { return { term: 'Color', value: 'f08080', location: location() }; }
  / 'lightcyan'            { return { term: 'Color', value: 'e0ffff', location: location() }; }
  / 'LightCyan'            { return { term: 'Color', value: 'e0ffff', location: location() }; }
  / 'lightgoldenrodyellow' { return { term: 'Color', value: 'fafad2', location: location() }; }
  / 'LightGoldenRodYellow' { return { term: 'Color', value: 'fafad2', location: location() }; }
  / 'lightgray'            { return { term: 'Color', value: 'd3d3d3', location: location() }; }
  / 'LightGray'            { return { term: 'Color', value: 'd3d3d3', location: location() }; }
  / 'lightgrey'            { return { term: 'Color', value: 'd3d3d3', location: location() }; }
  / 'LightGrey'            { return { term: 'Color', value: 'd3d3d3', location: location() }; }
  / 'lightgreen'           { return { term: 'Color', value: '90ee90', location: location() }; }
  / 'LightGreen'           { return { term: 'Color', value: '90ee90', location: location() }; }
  / 'lightpink'            { return { term: 'Color', value: 'ffb6c1', location: location() }; }
  / 'LightPink'            { return { term: 'Color', value: 'ffb6c1', location: location() }; }
  / 'lightsalmon'          { return { term: 'Color', value: 'ffa07a', location: location() }; }
  / 'LightSalmon'          { return { term: 'Color', value: 'ffa07a', location: location() }; }
  / 'lightseagreen'        { return { term: 'Color', value: '20b2aa', location: location() }; }
  / 'LightSeaGreen'        { return { term: 'Color', value: '20b2aa', location: location() }; }
  / 'lightskyblue'         { return { term: 'Color', value: '87cefa', location: location() }; }
  / 'LightSkyBlue'         { return { term: 'Color', value: '87cefa', location: location() }; }
  / 'lightslategray'       { return { term: 'Color', value: '778899', location: location() }; }
  / 'LightSlateGray'       { return { term: 'Color', value: '778899', location: location() }; }
  / 'lightslategrey'       { return { term: 'Color', value: '778899', location: location() }; }
  / 'LightSlateGrey'       { return { term: 'Color', value: '778899', location: location() }; }
  / 'lightsteelblue'       { return { term: 'Color', value: 'b0c4de', location: location() }; }
  / 'LightSteelBlue'       { return { term: 'Color', value: 'b0c4de', location: location() }; }
  / 'lightyellow'          { return { term: 'Color', value: 'ffffe0', location: location() }; }
  / 'LightYellow'          { return { term: 'Color', value: 'ffffe0', location: location() }; }
  / 'lime'                 { return { term: 'Color', value: '00ff00', location: location() }; }
  / 'Lime'                 { return { term: 'Color', value: '00ff00', location: location() }; }
  / 'limegreen'            { return { term: 'Color', value: '32cd32', location: location() }; }
  / 'LimeGreen'            { return { term: 'Color', value: '32cd32', location: location() }; }
  / 'linen'                { return { term: 'Color', value: 'faf0e6', location: location() }; }
  / 'Linen'                { return { term: 'Color', value: 'faf0e6', location: location() }; }
  / 'magenta'              { return { term: 'Color', value: 'ff00ff', location: location() }; }
  / 'Magenta'              { return { term: 'Color', value: 'ff00ff', location: location() }; }
  / 'maroon'               { return { term: 'Color', value: '800000', location: location() }; }
  / 'Maroon'               { return { term: 'Color', value: '800000', location: location() }; }
  / 'mediumaquamarine'     { return { term: 'Color', value: '66cdaa', location: location() }; }
  / 'MediumAquaMarine'     { return { term: 'Color', value: '66cdaa', location: location() }; }
  / 'mediumblue'           { return { term: 'Color', value: '0000cd', location: location() }; }
  / 'MediumBlue'           { return { term: 'Color', value: '0000cd', location: location() }; }
  / 'mediumorchid'         { return { term: 'Color', value: 'ba55d3', location: location() }; }
  / 'MediumOrchid'         { return { term: 'Color', value: 'ba55d3', location: location() }; }
  / 'mediumpurple'         { return { term: 'Color', value: '9370d8', location: location() }; }
  / 'MediumPurple'         { return { term: 'Color', value: '9370d8', location: location() }; }
  / 'mediumseagreen'       { return { term: 'Color', value: '3cb371', location: location() }; }
  / 'MediumSeaGreen'       { return { term: 'Color', value: '3cb371', location: location() }; }
  / 'mediumslateblue'      { return { term: 'Color', value: '7b68ee', location: location() }; }
  / 'MediumSlateBlue'      { return { term: 'Color', value: '7b68ee', location: location() }; }
  / 'mediumspringgreen'    { return { term: 'Color', value: '00fa9a', location: location() }; }
  / 'MediumSpringGreen'    { return { term: 'Color', value: '00fa9a', location: location() }; }
  / 'mediumturquoise'      { return { term: 'Color', value: '48d1cc', location: location() }; }
  / 'MediumTurquoise'      { return { term: 'Color', value: '48d1cc', location: location() }; }
  / 'mediumvioletred'      { return { term: 'Color', value: 'c71585', location: location() }; }
  / 'MediumVioletRed'      { return { term: 'Color', value: 'c71585', location: location() }; }
  / 'midnightblue'         { return { term: 'Color', value: '191970', location: location() }; }
  / 'MidnightBlue'         { return { term: 'Color', value: '191970', location: location() }; }
  / 'mintcream'            { return { term: 'Color', value: 'f5fffa', location: location() }; }
  / 'MintCream'            { return { term: 'Color', value: 'f5fffa', location: location() }; }
  / 'mistyrose'            { return { term: 'Color', value: 'ffe4e1', location: location() }; }
  / 'MistyRose'            { return { term: 'Color', value: 'ffe4e1', location: location() }; }
  / 'moccasin'             { return { term: 'Color', value: 'ffe4b5', location: location() }; }
  / 'Moccasin'             { return { term: 'Color', value: 'ffe4b5', location: location() }; }
  / 'navajowhite'          { return { term: 'Color', value: 'ffdead', location: location() }; }
  / 'NavajoWhite'          { return { term: 'Color', value: 'ffdead', location: location() }; }
  / 'navy'                 { return { term: 'Color', value: '000080', location: location() }; }
  / 'Navy'                 { return { term: 'Color', value: '000080', location: location() }; }
  / 'oldlace'              { return { term: 'Color', value: 'fdf5e6', location: location() }; }
  / 'OldLace'              { return { term: 'Color', value: 'fdf5e6', location: location() }; }
  / 'olive'                { return { term: 'Color', value: '808000', location: location() }; }
  / 'Olive'                { return { term: 'Color', value: '808000', location: location() }; }
  / 'olivedrab'            { return { term: 'Color', value: '6b8e23', location: location() }; }
  / 'OliveDrab'            { return { term: 'Color', value: '6b8e23', location: location() }; }
  / 'orange'               { return { term: 'Color', value: 'ffa500', location: location() }; }
  / 'Orange'               { return { term: 'Color', value: 'ffa500', location: location() }; }
  / 'orangered'            { return { term: 'Color', value: 'ff4500', location: location() }; }
  / 'OrangeRed'            { return { term: 'Color', value: 'ff4500', location: location() }; }
  / 'orchid'               { return { term: 'Color', value: 'da70d6', location: location() }; }
  / 'Orchid'               { return { term: 'Color', value: 'da70d6', location: location() }; }
  / 'palegoldenrod'        { return { term: 'Color', value: 'eee8aa', location: location() }; }
  / 'PaleGoldenRod'        { return { term: 'Color', value: 'eee8aa', location: location() }; }
  / 'palegreen'            { return { term: 'Color', value: '98fb98', location: location() }; }
  / 'PaleGreen'            { return { term: 'Color', value: '98fb98', location: location() }; }
  / 'paleturquoise'        { return { term: 'Color', value: 'afeeee', location: location() }; }
  / 'PaleTurquoise'        { return { term: 'Color', value: 'afeeee', location: location() }; }
  / 'palevioletred'        { return { term: 'Color', value: 'd87093', location: location() }; }
  / 'PaleVioletRed'        { return { term: 'Color', value: 'd87093', location: location() }; }
  / 'papayawhip'           { return { term: 'Color', value: 'ffefd5', location: location() }; }
  / 'PapayaWhip'           { return { term: 'Color', value: 'ffefd5', location: location() }; }
  / 'peachpuff'            { return { term: 'Color', value: 'ffdab9', location: location() }; }
  / 'PeachPuff'            { return { term: 'Color', value: 'ffdab9', location: location() }; }
  / 'peru'                 { return { term: 'Color', value: 'cd853f', location: location() }; }
  / 'Peru'                 { return { term: 'Color', value: 'cd853f', location: location() }; }
  / 'pink'                 { return { term: 'Color', value: 'ffc0cb', location: location() }; }
  / 'Pink'                 { return { term: 'Color', value: 'ffc0cb', location: location() }; }
  / 'plum'                 { return { term: 'Color', value: 'dda0dd', location: location() }; }
  / 'Plum'                 { return { term: 'Color', value: 'dda0dd', location: location() }; }
  / 'powderblue'           { return { term: 'Color', value: 'b0e0e6', location: location() }; }
  / 'PowderBlue'           { return { term: 'Color', value: 'b0e0e6', location: location() }; }
  / 'purple'               { return { term: 'Color', value: '800080', location: location() }; }
  / 'Purple'               { return { term: 'Color', value: '800080', location: location() }; }
  / 'red'                  { return { term: 'Color', value: 'ff0000', location: location() }; }
  / 'Red'                  { return { term: 'Color', value: 'ff0000', location: location() }; }
  / 'rosybrown'            { return { term: 'Color', value: 'bc8f8f', location: location() }; }
  / 'RosyBrown'            { return { term: 'Color', value: 'bc8f8f', location: location() }; }
  / 'royalblue'            { return { term: 'Color', value: '4169e1', location: location() }; }
  / 'RoyalBlue'            { return { term: 'Color', value: '4169e1', location: location() }; }
  / 'saddlebrown'          { return { term: 'Color', value: '8b4513', location: location() }; }
  / 'SaddleBrown'          { return { term: 'Color', value: '8b4513', location: location() }; }
  / 'salmon'               { return { term: 'Color', value: 'fa8072', location: location() }; }
  / 'Salmon'               { return { term: 'Color', value: 'fa8072', location: location() }; }
  / 'sandybrown'           { return { term: 'Color', value: 'f4a460', location: location() }; }
  / 'SandyBrown'           { return { term: 'Color', value: 'f4a460', location: location() }; }
  / 'seagreen'             { return { term: 'Color', value: '2e8b57', location: location() }; }
  / 'SeaGreen'             { return { term: 'Color', value: '2e8b57', location: location() }; }
  / 'seashell'             { return { term: 'Color', value: 'fff5ee', location: location() }; }
  / 'SeaShell'             { return { term: 'Color', value: 'fff5ee', location: location() }; }
  / 'sienna'               { return { term: 'Color', value: 'a0522d', location: location() }; }
  / 'Sienna'               { return { term: 'Color', value: 'a0522d', location: location() }; }
  / 'silver'               { return { term: 'Color', value: 'c0c0c0', location: location() }; }
  / 'Silver'               { return { term: 'Color', value: 'c0c0c0', location: location() }; }
  / 'skyblue'              { return { term: 'Color', value: '87ceeb', location: location() }; }
  / 'SkyBlue'              { return { term: 'Color', value: '87ceeb', location: location() }; }
  / 'slateblue'            { return { term: 'Color', value: '6a5acd', location: location() }; }
  / 'SlateBlue'            { return { term: 'Color', value: '6a5acd', location: location() }; }
  / 'slategray'            { return { term: 'Color', value: '708090', location: location() }; }
  / 'SlateGray'            { return { term: 'Color', value: '708090', location: location() }; }
  / 'slategrey'            { return { term: 'Color', value: '708090', location: location() }; }
  / 'SlateGrey'            { return { term: 'Color', value: '708090', location: location() }; }
  / 'snow'                 { return { term: 'Color', value: 'fffafa', location: location() }; }
  / 'Snow'                 { return { term: 'Color', value: 'fffafa', location: location() }; }
  / 'springgreen'          { return { term: 'Color', value: '00ff7f', location: location() }; }
  / 'SpringGreen'          { return { term: 'Color', value: '00ff7f', location: location() }; }
  / 'steelblue'            { return { term: 'Color', value: '4682b4', location: location() }; }
  / 'SteelBlue'            { return { term: 'Color', value: '4682b4', location: location() }; }
  / 'tan'                  { return { term: 'Color', value: 'd2b48c', location: location() }; }
  / 'Tan'                  { return { term: 'Color', value: 'd2b48c', location: location() }; }
  / 'teal'                 { return { term: 'Color', value: '008080', location: location() }; }
  / 'Teal'                 { return { term: 'Color', value: '008080', location: location() }; }
  / 'thistle'              { return { term: 'Color', value: 'd8bfd8', location: location() }; }
  / 'Thistle'              { return { term: 'Color', value: 'd8bfd8', location: location() }; }
  / 'tomato'               { return { term: 'Color', value: 'ff6347', location: location() }; }
  / 'Tomato'               { return { term: 'Color', value: 'ff6347', location: location() }; }
  / 'turquoise'            { return { term: 'Color', value: '40e0d0', location: location() }; }
  / 'Turquoise'            { return { term: 'Color', value: '40e0d0', location: location() }; }
  / 'violet'               { return { term: 'Color', value: 'ee82ee', location: location() }; }
  / 'Violet'               { return { term: 'Color', value: 'ee82ee', location: location() }; }
  / 'wheat'                { return { term: 'Color', value: 'f5deb3', location: location() }; }
  / 'Wheat'                { return { term: 'Color', value: 'f5deb3', location: location() }; }
  / 'white'                { return { term: 'Color', value: 'ffffff', location: location() }; }
  / 'White'                { return { term: 'Color', value: 'ffffff', location: location() }; }
  / 'whitesmoke'           { return { term: 'Color', value: 'f5f5f5', location: location() }; }
  / 'WhiteSmoke'           { return { term: 'Color', value: 'f5f5f5', location: location() }; }
  / 'yellow'               { return { term: 'Color', value: 'ffff00', location: location() }; }
  / 'Yellow'               { return { term: 'Color', value: 'ffff00', location: location() }; }
  / 'yellowgreen'          { return { term: 'Color', value: '9acd32', location: location() }; }
  / 'YellowGreen'          { return { term: 'Color', value: '9acd32', location: location() }; }


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


Shape "shape"
 = "box"             { return { term: 'Shape', value: 'box',             location: location() }; }
 / "polygon"         { return { term: 'Shape', value: 'polygon',         location: location() }; }
 / "ellipse"         { return { term: 'Shape', value: 'ellipse',         location: location() }; }
 / "oval"            { return { term: 'Shape', value: 'oval',            location: location() }; }
 / "circle"          { return { term: 'Shape', value: 'circle',          location: location() }; }
 / "point"           { return { term: 'Shape', value: 'point',           location: location() }; }
 / "egg"             { return { term: 'Shape', value: 'egg',             location: location() }; }
 / "triangle"        { return { term: 'Shape', value: 'triangle',        location: location() }; }
 / "plaintext"       { return { term: 'Shape', value: 'plaintext',       location: location() }; }
 / "plain"           { return { term: 'Shape', value: 'plain',           location: location() }; }
 / "diamond"         { return { term: 'Shape', value: 'diamond',         location: location() }; }
 / "trapezium"       { return { term: 'Shape', value: 'trapezium',       location: location() }; }
 / "parallelogram"   { return { term: 'Shape', value: 'parallelogram',   location: location() }; }
 / "house"           { return { term: 'Shape', value: 'house',           location: location() }; }
 / "pentagon"        { return { term: 'Shape', value: 'pentagon',        location: location() }; }
 / "hexagon"         { return { term: 'Shape', value: 'hexagon',         location: location() }; }
 / "septagon"        { return { term: 'Shape', value: 'septagon',        location: location() }; }
 / "octagon"         { return { term: 'Shape', value: 'octagon',         location: location() }; }
 / "doublecircle"    { return { term: 'Shape', value: 'doublecircle',    location: location() }; }
 / "doubleoctagon"   { return { term: 'Shape', value: 'doubleoctagon',   location: location() }; }
 / "tripleoctagon"   { return { term: 'Shape', value: 'tripleoctagon',   location: location() }; }
 / "invtriangle"     { return { term: 'Shape', value: 'invtriangle',     location: location() }; }
 / "invtrapezium"    { return { term: 'Shape', value: 'invtrapezium',    location: location() }; }
 / "invhouse"        { return { term: 'Shape', value: 'invhouse',        location: location() }; }
 / "Mdiamond"        { return { term: 'Shape', value: 'Mdiamond',        location: location() }; }
 / "Msquare"         { return { term: 'Shape', value: 'Msquare',         location: location() }; }
 / "Mcircle"         { return { term: 'Shape', value: 'Mcircle',         location: location() }; }
 / "rect"            { return { term: 'Shape', value: 'rect',            location: location() }; }
 / "rectangle"       { return { term: 'Shape', value: 'rectangle',       location: location() }; }
 / "square"          { return { term: 'Shape', value: 'square',          location: location() }; }
 / "star"            { return { term: 'Shape', value: 'star',            location: location() }; }
 / "none"            { return { term: 'Shape', value: 'none',            location: location() }; }
 / "underline"       { return { term: 'Shape', value: 'underline',       location: location() }; }
 / "cylinder"        { return { term: 'Shape', value: 'cylinder',        location: location() }; }
 / "note"            { return { term: 'Shape', value: 'note',            location: location() }; }
 / "tab"             { return { term: 'Shape', value: 'tab',             location: location() }; }
 / "folder"          { return { term: 'Shape', value: 'folder',          location: location() }; }
 / "box3d"           { return { term: 'Shape', value: 'box3d',           location: location() }; }
 / "component"       { return { term: 'Shape', value: 'component',       location: location() }; }
 / "promoter"        { return { term: 'Shape', value: 'promoter',        location: location() }; }
 / "cds"             { return { term: 'Shape', value: 'cds',             location: location() }; }
 / "terminator"      { return { term: 'Shape', value: 'terminator',      location: location() }; }
 / "utr"             { return { term: 'Shape', value: 'utr',             location: location() }; }
 / "primersite"      { return { term: 'Shape', value: 'primersite',      location: location() }; }
 / "restrictionsite" { return { term: 'Shape', value: 'restrictionsite', location: location() }; }
 / "fivepoverhang"   { return { term: 'Shape', value: 'fivepoverhang',   location: location() }; }
 / "threepoverhang"  { return { term: 'Shape', value: 'threepoverhang',  location: location() }; }
 / "noverhang"       { return { term: 'Shape', value: 'noverhang',       location: location() }; }
 / "assembly"        { return { term: 'Shape', value: 'assembly',        location: location() }; }
 / "signature"       { return { term: 'Shape', value: 'signature',       location: location() }; }
 / "insulator"       { return { term: 'Shape', value: 'insulator',       location: location() }; }
 / "ribosite"        { return { term: 'Shape', value: 'ribosite',        location: location() }; }
 / "rnastab"         { return { term: 'Shape', value: 'rnastab',         location: location() }; }
 / "proteasesite"    { return { term: 'Shape', value: 'proteasesite',    location: location() }; }
 / "proteinstab"     { return { term: 'Shape', value: 'proteinstab',     location: location() }; }
 / "rpromoter"       { return { term: 'Shape', value: 'rpromoter',       location: location() }; }
 / "rarrow"          { return { term: 'Shape', value: 'rarrow',          location: location() }; }
 / "larrow"          { return { term: 'Shape', value: 'larrow',          location: location() }; }
 / "lpromoter"       { return { term: 'Shape', value: 'lpromoter',       location: location() }; }
 / "record"          { return { term: 'Shape', value: 'record',          location: location() }; }
