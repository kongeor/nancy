import 'package:nancy/datatypes.dart';
import 'package:test/test.dart';

void main() {
  test('runtime type test', () {
    expect('foo'.runtimeType, String);
  });

  group('symbols', () {
    test('symbol to string', () {
      expect(SymbExpr('foo').toString(), 'foo');
    });

    test('symbol equality', () {
      expect(SymbExpr('foo'), SymbExpr('foo'));
    });
  });
}
