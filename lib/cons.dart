import 'datatypes.dart';

class Cons implements NancyExpr {
  final Object _car;
  final Object _cdr;

  Cons(this._car, [this._cdr]);

  static Cons fromList(List<Object> list) {
    Cons cons;
    for (var i = list.length - 1; i >= 0; i--) {
      cons = Cons(list[i], cons);
    }
    return cons;
  }

  Object car() {
    return _car;
  }

  Object cdr() {
    return _cdr;
  }

  NancyExpr lookup(SymbExpr symb) {
    NancyExpr c = this;
    while (c != null) {
      Cons head = (c as Cons)._car;
      if (head._car == symb) {
        return head._cdr;
      }
      c = (c as Cons)._cdr;
    }
    return null;
  }

  Object nth(n) {
    var idx = 0;
    NancyExpr current = this;
    while (current != null && idx != n) {
      current = (current as Cons).cdr();
      idx++;
    }
    return (current as Cons).car();
  }
}
