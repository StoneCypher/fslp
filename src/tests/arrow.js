
/* eslint-disable max-len */

import {describe} from 'ava-spec';

const fslp = require('../../build/fslp.js');





describe('a->b', async it => {

  it('a -> b;', t => t.is('transition', fslp.parse('a->b;').value[0].term ));

});
