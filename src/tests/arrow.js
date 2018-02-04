
/* eslint-disable max-len */

import {describe} from 'ava-spec';

const fslp = require('../../build/fslp.js');





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

  const tpad = [].concat(... pads.map(l => pads.map(r => ({l, r}))));

  const make_test = pad => {
    const src = `a${pad.l}->${pad.r}b;`;
    it(src, t => t.is('transition', fslp.parse(src).value[0].term ));
  }

  tpad.map(pad => make_test(pad));

  it('a -> b;', t => t.is('transition', fslp.parse('a->b;').value[0].term ));

});
