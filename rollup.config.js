
import nodeResolve from 'rollup-plugin-node-resolve';
import commonjs    from 'rollup-plugin-commonjs';

const pkg = require('./package');

export default {

  input     : 'src/ts/fslp.js',
//moduleId  : pkg.name,

  output    : {
    file      : 'build/fslp.js',
    format    : 'cjs',
    name      : 'fslp',
    sourcemap : true,
  },

  plugins   : [

    commonjs({
      namedExports: {
//      'node_modules/react/index.js'     : ['createElement', 'Component'],
//      'node_modules/react-dom/index.js' : ['render'],
      },
    }),

    nodeResolve({
      module: true,
      jsnext: true,
      browser: true,
//    extensions: [ '.js', '.json', '.jsx', '.ts', '.tsx' ],
      extensions: [ '.js', '.json', '.ts' ],
      preferBuiltins: false
    }),

  ]
}