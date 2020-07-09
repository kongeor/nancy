class NancyExpr {
  // String _x = "foo";
}

class SymbExpr implements NancyExpr {
  final String _name;

  SymbExpr(this._name);

  String name() {
    return _name;
  }

  @override
  int get hashCode => _name.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (other is! SymbExpr) return false;
    SymbExpr symb = other;
    return symb._name == _name;
  }

  @override
  String toString() => _name;
}
