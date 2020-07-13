enum TokenType {
  LEFT_PAREN,
  RIGHT_PAREN,

  EOF
}

class Token {
  final TokenType type;
  final String lexeme;
  final Object literal;
  final int line;

  Token(this.type, this.lexeme, this.literal, this.line);
}

class Scanner {
  final String source;

  List<Token> tokens = [];

  int start = 0;
  int current = 0;
  int line = 1;

  Scanner(this.source);

  List<Token> getTokens() {
    while (!_isAtEnd()) {
      start = current;
      _scanToken();
    }

    tokens.add(Token(TokenType.EOF, '', null, line));
    return tokens;
  }

  bool _isAtEnd() {
    return current >= source.length;
  }

  void _scanToken() {
    var char = _advance();

    switch (char) {
      case "(":
        _addToken(TokenType.LEFT_PAREN);
        break;
    }
  }

  String _advance() {
    current++;
    return source.substring(current - 1, current);
  }

  void _addToken(TokenType type, [Object literal]) {
    var text = source.substring(start, current);
    tokens.add(Token(type, text, literal, line));
  }
}
