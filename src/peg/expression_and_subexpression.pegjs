
// todo whargarbl these subexpr terms are currently ordered, and that's stupid
// change this to be unordered

Subexpr
  = _WS? r_action : _ActionLabel?
    _WS? r_prob   :  ArrowProbability?
    _WS? l_desc   :  ArrowDesc?
    _WS? arrow    :  Arrow
    _WS? r_desc   :  ArrowDesc?
    _WS? l_prob   :  ArrowProbability?
    _WS? l_action : _ActionLabel?
    _WS? label    :  ArrowTarget
    _WS? tail     :  Subexpr? {

      // this changed kind to key.  some breakage may result?
      const base = { term: 'transition-se', key: arrow, to: label };

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
  = label:ArrowTarget se:Subexpr _WS? ';' _WS? {
    return { term: 'transition', from: label, se: (se && (se !== []))? se : undefined };
  }
