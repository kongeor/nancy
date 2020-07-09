import 'bool.dart';
import 'cons.dart';
import 'datatypes.dart';
import 'env.dart';

Object _evalIf(Env env, Object pred, Object ifExp, Object elseExp) {
  var res = eval(env, pred);
  if (Bool.isTruthy(res)) {
    return eval(env, ifExp);
  } else {
    return eval(env, elseExp);
  }
}

Object _evalDo(Env env, Object exprs) {
  var result = null;

  var e = exprs;
  while (e != null) {
    result = eval(env, (e as Cons).car());
    e = (e as Cons).cdr();
  }

  return result;
}

Object _evalDef(Env env, SymbExpr symb, Object val) {
  var res = eval(env, val);
  Env.bindGlobal(symb, res);
  return res;
}

Object _evalSexpr(Env env, SymbExpr symbExpr, NancyExpr form) {
  var s = symbExpr.name();

  switch (s) {
    case 'if':
      {
        Cons f = form;
        return _evalIf(env, f.nth(0), f.nth(1), f.nth(2));
      }
    case 'do':
      {
        Cons f = form;
        return _evalDo(env, f);
      }
    case 'def':
      {
        Cons f = form;
        return _evalDef(env, f.nth(0), f.nth(1));
      }
  }
}

Object eval(Env env, Object form) {
  if (form is Cons) {
    var cons = form;
    if (cons.car() is SymbExpr) {
      return _evalSexpr(env, cons.car() as SymbExpr, cons.cdr());
    }
  } else if (form is SymbExpr) {
    return env.lookup(form);
  }
  return form;
}
