
Stripe
  = '+|' value:NonNegIntegerLiteral { return { key: 'stripe', value,                  location: location() }; }
  / '-|' value:NonNegIntegerLiteral { return { key: 'stripe', value: signflip(value), location: location() }; }

Cycle
  = '+'  value:NonNegIntegerLiteral { return { key: 'cycle',  value,                  location: location() }; }
  / '-'  value:NonNegIntegerLiteral { return { key: 'cycle',  value: signflip(value), location: location() }; }
