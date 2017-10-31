
Stripe
  = '+|' nzd:NonZeroDigit dd:DecimalDigit* { return { key: 'stripe', value:      parseInt(`${nzd}${dd}`, 10) }; }
  / '-|' nzd:NonZeroDigit dd:DecimalDigit* { return { key: 'stripe', value: -1 * parseInt(`${nzd}${dd}`, 10) }; }

Cycle
  = '+' nzd:NonZeroDigit dd:DecimalDigit* { return { key: 'cycle', value:      parseInt(`${nzd}${dd}`, 10) }; }
  / '-' nzd:NonZeroDigit dd:DecimalDigit* { return { key: 'cycle', value: -1 * parseInt(`${nzd}${dd}`, 10) }; }
  / '+0'                                  { return { key: 'cycle', value: 0                                }; }
