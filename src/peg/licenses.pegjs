
LicenseNotation "license"
  = 'MIT'                    { return { term: 'license', value: 'MIT',           known: true,  viral: false,     location: location() }; }
  / 'BSD 2-clause'           { return { term: 'license', value: 'BSD 2-clause',  known: true,  viral: false,     location: location() }; }
  / 'BSD 3-clause'           { return { term: 'license', value: 'BSD 3-clause',  known: true,  viral: false,     location: location() }; }
  / 'Apache 2.0'             { return { term: 'license', value: 'Apache 2.0',    known: true,  viral: false,     location: location() }; }
  / 'Mozilla 2.0'            { return { term: 'license', value: 'Mozilla 2.0',   known: true,  viral: false,     location: location() }; }
  / 'Public domain'          { return { term: 'license', value: 'Public domain', known: true,  viral: false,     location: location() }; }
  / 'GPL v2'                 { return { term: 'license', value: 'GPL v2',        known: true,  viral: true,      location: location() }; }
  / 'GPL v3'                 { return { term: 'license', value: 'GPV v3',        known: true,  viral: true,      location: location() }; }
  / 'LGPL v2.1'              { return { term: 'license', value: 'LGPL v2.1',     known: true,  viral: true,      location: location() }; }
  / 'LGPL v3.0'              { return { term: 'license', value: 'LGPL v3.0',     known: true,  viral: true,      location: location() }; }
  / 'Unknown license'        { return { term: 'license', value: undefined,       known: false, viral: undefined, location: location() }; }
  / 'License ' custom:_Label { return { term: 'license', value: custom,          known: true,  viral: undefined, location: location() }; }
