package gr.cons.nancy.lang;

import gr.cons.nancy.lang.App.*;

public class Checker {

    public record Pair<L, R>(L left, R right) {}

    public static void checkEqualType(NancyType t1, NancyType t2, NancyExpr e) {
        if (!t1.equals(t2)) {
            throw new IllegalArgumentException("Type mismatch: " + t1 + " " + t2 + " " + e);
        }
    }

    public static Pair<NancyType, Env> typeOf(App.NancyExpr expr, Env tenv) {
        return switch (expr) {
            case NumExpr(var ignored) -> new Pair<>(new App.IntType(), tenv);
            case BoolExpr(var ignored) -> new Pair<>(new App.BoolType(), tenv);
            case SymbExpr symbExpr -> new Pair<>((NancyType)tenv.lookup(symbExpr), tenv);
            case DiffExpr(var e1, var e2) -> {
                var t1 = typeOf(e1, tenv);
                var t2 = typeOf(e2, tenv);
                checkEqualType(t1.left, new IntType(), e1);
                checkEqualType(t2.left, new IntType(), e2);
                yield new Pair<>(t1.left, tenv);
            }
            case IfExpr (var e1, var e2, var e3) -> {
                var t1 = typeOf(e1, tenv);
                var t2 = typeOf(e2, tenv);
                var t3 = typeOf(e3, tenv);
                checkEqualType(t1.left, new BoolType(), e1);
                checkEqualType(t2.left, t3.left, e1); // TODO fix, how to pass entire
                yield new Pair<>(t2.left, tenv);
            }
            case LetExpr(NancyExpr varName, NancyExpr expr1, NancyExpr body) -> {
                var expr1Type = typeOf(expr1, tenv);
                yield typeOf(body, tenv.bind((SymbExpr) varName, expr1Type.left));
            }
            case FnExpr(NancyExpr binding, NancyExpr body) -> {
                var bindType = ((SymbExpr) binding).type().orElse(null);
                var resultType = typeOf(body, tenv.bind((SymbExpr) binding, bindType));
                yield new Pair<>(new FuncType(bindType, resultType.left), tenv.bind((SymbExpr) binding, resultType.left));

            }
            case CallExpr(NancyExpr rator, NancyExpr rand) -> {
                var ratorType = typeOf(rator, tenv);
                var randType = typeOf(rand, tenv);
                yield switch (ratorType.left) { // TODO notice the wrong warning ;)
                    case FuncType(NancyType from, NancyType to) -> {
                        checkEqualType(randType.left, from, rand); // TODO again, how to pass entire expr
                        yield new Pair<>(to, tenv);
                    }
                    default ->
                        throw new IllegalArgumentException("Not funky enough: " + ratorType);
                };
            }

            case NancyType nancyType -> new Pair<>(nancyType, tenv);
            case NilExpr nilExpr -> throw new UnsupportedOperationException("Don't know: " + nilExpr);
            case Cons cons -> throw new UnsupportedOperationException("Don't know: " + cons);
        };
    }
}
