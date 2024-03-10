grammar Nancy;

@header {
    package gr.cons.nancy.parser;
}

prog:	expr EOF ;
expr:   ': ' type_expr
    |   INT
    |   SYMB
    |	'(' expr+ ')'
    |	'[' expr+ ']'
    |   WS ;
type_expr: INT_TYPE
         | BOOL_TYPE
         | '(' type_expr '->' type_expr ')' ;
INT_TYPE : 'int' ;
BOOL_TYPE : 'bool' ;
INT     : [0-9]+ ;
SYMB    : [a-z]+ ;
WS : [ \r\t\n]+ -> skip ;