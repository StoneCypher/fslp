
/* eslint-disable max-len */

import {describe} from 'ava-spec';

const fslp = require('../../build/fslp.js');





describe('quick checklist - ', async it => {

  it('parses transitions',       t => t.is('transition', fslp.parse('a->b;').value[0].term ));
  it('unicode bidi transitions', t => t.is('transition', fslp.parse('a↮b;').value[0].term ));
  it('string names',             t => t.is('transition', fslp.parse('"a b"->"c->d";').value[0].term ));
  it('spread transitions',       t => t.is('label_list', fslp.parse('[a b]->[c d];').value[0].from.type ));

});
