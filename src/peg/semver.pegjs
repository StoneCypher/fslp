
SemVer
  = major:NonNegIntegerLiteral "." minor:NonNegIntegerLiteral "." patch:NonNegIntegerLiteral
  {
    const pmajor = parseInt(major.value, 10),
          pminor = parseInt(minor.value, 10),
          ppatch = parseInt(patch.value, 10);

    return {
      term   : 'semver',

      major  : pmajor,
      minor  : pminor,
      patch  : ppatch,

      parsed : [pmajor, pminor, ppatch],

      value  : text()
    };
  }

_SemVerOper
  = "^"
  / "~"
  / ">="
  / "<="
  / "<"
  / ">"

_SemVerRule
  = _SemVerOper? SemVer

_SemVerRange
  = _SemVerRule _SemVerRule?
