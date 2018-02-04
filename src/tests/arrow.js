
/* eslint-disable max-len */

import {describe} from 'ava-spec';

const fslp = require('../../build/fslp.js');





function t_expand(term_obj, terms, work = {}) {

  if (terms.length) {

    const [thisTerm, ... remTerms] = terms;

    if (!(Array.isArray(term_obj[thisTerm]))) {
      throw new TypeError(`Every value must be an array.  Index ${thisTerm} is not.`);
    }

    return [].concat.apply([], term_obj[thisTerm].map(tt => {
      const newCfg = Object.assign({}, work);
      newCfg[thisTerm] = tt;
      return t_expand(term_obj, remTerms, newCfg);
    }));

  } else {
    return work;
  }

}

/*
expand({bob: ['bob', 'robert'], bill: ['bill', 'william'] });
 {bob: "bob", bill: "bill"}
 {bob: "bob", bill: "william"}
 {bob: "robert", bill: "bill"}
 {bob: "robert", bill: "william"}
*/

function expand(term_obj) {
  return t_expand(term_obj, Object.keys(term_obj));
}





describe('expand requires arrays', async it => {
  it('throwing otherwise', t => t.throws(() => expand({a:2})));
});





describe('arrow kinds', async it => {

  const arrows = [
    { write: '->',  rkind: 'normal' },
    { write: '~>',  rkind: 'forced' },
    { write: '=>',  rkind: 'main'   },
    { write: '<-',  lkind: 'normal' },
    { write: '<~',  lkind: 'forced' },
    { write: '<=',  lkind: 'main'   },
    { write: '<->', rkind: 'normal', lkind: 'normal' },
    { write: '<~>', rkind: 'forced', lkind: 'forced' },
    { write: '<=>', rkind: 'main',   lkind: 'main'   }
  ];

  arrows.map(arrow => {
    const src = `a${arrow.write}b;`;
    it(src, t => t.is('transition', fslp.parse(src).value[0].term ));
  });

});





describe('basic expressions', async it => {

  const arrows = [
    { write: '->',  rkind: 'normal' },
    { write: '~>',  rkind: 'forced' },
    { write: '=>',  rkind: 'main'   },
    { write: '<-',  lkind: 'normal' },
    { write: '<~',  lkind: 'forced' },
    { write: '<=',  lkind: 'main'   },
    { write: '<->', rkind: 'normal', lkind: 'normal' },
    { write: '<~>', rkind: 'forced', lkind: 'forced' },
    { write: '<=>', rkind: 'main',   lkind: 'main'   }
  ];

  const pads = ['', ' ', '\t', '\r', '\n', '\r\n', ' \r\n\t\n\n \n '];

  const tpad = expand({ l: pads, r: pads, sem: pads });

  const make_test = pad => {
    const src = `a${pad.l}->${pad.r}b${pad.sem};`;
    it(src, t => t.is('transition', fslp.parse(src).value[0].term ));
  }

  tpad.map(pad => make_test(pad));

});
