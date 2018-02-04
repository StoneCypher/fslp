
/* eslint-disable max-len */

import {describe} from 'ava-spec';

const fslp = require('../../build/fslp.js');





describe('can parse', async it => {

  it('red',       t => t.is('ff0000ff', fslp.parse('red').value       ));
  it('#f00',      t => t.is('ff0000ff', fslp.parse('#f00').value      ));
  it('#f00f',     t => t.is('ff0000ff', fslp.parse('#f00f').value     ));
  it('#ff0000',   t => t.is('ff0000ff', fslp.parse('#ff0000').value   ));
  it('#ff0000ff', t => t.is('ff0000ff', fslp.parse('#ff0000ff').value ));

});
