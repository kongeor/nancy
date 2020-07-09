import 'cons.dart';
import 'datatypes.dart';

class Env {
  static final Map<SymbExpr, Object> _globals = {};

  final Cons _cons;

  Env([this._cons]);

  static void bindGlobal(SymbExpr symb, Object obj) {
    _globals[symb] = obj;
  }

  static void bindStringGlobal(String symb, Object obj) {
    _globals[SymbExpr(symb)] = obj;
  }

  static void resetGlobalEnv() {
    _globals.clear();
  }

  static Object lookupGlobal(SymbExpr sym) {
    var obj = _globals[sym];
    if (obj == null) {
      throw Exception('Symbol binding ${sym} not found in env');
    }
    return obj;
  }

  Object lookup(SymbExpr symb) {
    if (_cons != null) {
      var lookup = _cons.lookup(symb);
      if (lookup != null) {
        return lookup;
      }
    }
    return lookupGlobal(symb);
  }

  Env bind(SymbExpr symb, Object val) {
    return Env(Cons(Cons(symb, val), _cons));
  }

  // TODO base env
}
