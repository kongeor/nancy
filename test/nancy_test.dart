import 'package:nancy/nancy.dart';
import 'package:nancy/datatypes.dart';
import 'package:nancy/env.dart';
import 'package:nancy/cons.dart';
import 'package:test/test.dart';

void main() {
  test('basic eval', () {
    var env = Env(Cons(Cons(SymbExpr('foo'), SymbExpr('bar'))));
    var form = Cons(SymbExpr('if'), Cons(true, Cons('42', Cons('10'))));
    expect(eval(env, form), '42');
  });

  test('basic list eval', () {
    var env = Env(Cons(Cons(SymbExpr('foo'), SymbExpr('bar'))));
    var form = Cons.fromList([SymbExpr('if'), false, '42', '10']);
    expect(eval(env, form), '10');
  });

  test('eval do', () {
    var env = Env(Cons(Cons(SymbExpr('foo'), SymbExpr('bar'))));
    var form = Cons.fromList([SymbExpr('do'), false, '42', SymbExpr('foo')]);
    expect(eval(env, form), SymbExpr('bar'));
  });

  test('eval def', () {
    var env = Env();
    var form = Cons.fromList([
      SymbExpr('do'),
      Cons.fromList([SymbExpr('def'), SymbExpr('foo'), 10]),
      SymbExpr('foo')
    ]);
    expect(eval(env, form), 10);
  });
}
