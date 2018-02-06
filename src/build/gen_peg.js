
const fs      = require("fs");
const pegjs   = require("pegjs");

const grammar = `${fs.readFileSync("./build/fsl-peg.pegjs")}`;





var parser = pegjs.generate(grammar, {

  output   : "source",
  format   : "commonjs",
  optimize : "size"

});

fs.writeFileSync('./build/gen/parser.js', parser, {flag: 'w'});
