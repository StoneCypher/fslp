
/* eslint-disable max-len */

import {describe} from 'ava-spec';

const fslp = require('../../build/fslp.js');





describe('can run specs', async it => {

  it('can parse bob', t => t.is('bob', fslp.parse('bob') ));
  it('can parse joe', t => t.is('joe', fslp.parse('joe') ));

  it('cannot parse dan', t => t.throws( () => fslp.parse('dan')  ));
  it('cannot parse dan', t => t.throws( () => fslp.parse('bab')  ));
  it('cannot parse dan', t => t.throws( () => fslp.parse('boa')  ));
  it('cannot parse dan', t => t.throws( () => fslp.parse('bobs') ));
  it('cannot parse dan', t => t.throws( () => fslp.parse('jab')  ));
  it('cannot parse dan', t => t.throws( () => fslp.parse('joa')  ));
  it('cannot parse dan', t => t.throws( () => fslp.parse('joes') ));

});
