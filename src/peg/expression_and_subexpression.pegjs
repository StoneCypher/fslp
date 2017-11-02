
// todo whargarbl these subexpr terms are currently ordered, and that's stupid
// change this to be unordered

Subexpr
  = WS? r_action : ActionLabel?
    WS? r_prob   : ArrowProbability?
    WS? l_desc   : ArrowDesc?
    WS? arrow    : Arrow
    WS? r_desc   : ArrowDesc?
    WS? l_prob   : ArrowProbability?
    WS? l_action : ActionLabel?
    WS? label    : ArrowTarget
    WS? tail     : Subexpr? {

      // this changed kind to key.  some breakage may result?
      const base = { key: arrow, to: label };

      if (tail && (tail !== [])) { base.se            = tail;         }
      if (l_desc)                { base.l_desc        = l_desc;       }
      if (r_desc)                { base.r_desc        = r_desc;       }
      if (l_action)              { base.l_action      = l_action;     }
      if (r_action)              { base.r_action      = r_action;     }
      if (l_prob)                { base.l_probability = l_prob.value; }
      if (r_prob)                { base.r_probability = r_prob.value; }

      return base;

    }



Expr
  = label:ArrowTarget se:Subexpr WS? ';' WS? {
    return { key: 'transition', from: label, se: (se && (se !== []))? se : undefined };
  }
