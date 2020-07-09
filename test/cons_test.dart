import 'package:nancy/cons.dart';
import 'package:nancy/datatypes.dart';
import 'package:test/test.dart';

void main() {
  test('cons successful lookup', () {
    var cons = Cons(Cons(SymbExpr('foo'), SymbExpr('bar')));
    expect(cons.lookup(SymbExpr('foo')), SymbExpr('bar'));
  });

  test('cons failed lookup', () {
    var cons = Cons(Cons(SymbExpr('foo'), SymbExpr('bar')));
    expect(cons.lookup(SymbExpr('baz')), null);
  });
}
