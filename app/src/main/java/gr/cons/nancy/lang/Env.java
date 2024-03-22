package gr.cons.nancy.lang;

import gr.cons.nancy.lang.App.NancyExpr;

import java.util.HashMap;
import java.util.Map;

import static gr.cons.nancy.lang.App.*;

public class Env {

    private final NancyExpr cons;

    public Env() {
        this.cons = NilExpr.NIL;
    }
    public Env(NancyExpr cons) {
        this.cons = cons;
    }

    public static Env of(Cons cons) {
        return new Env(cons);
    }

    public NancyExpr lookup(SymbExpr sym) {
        if (cons != NilExpr.NIL) {
            NancyExpr lookup = ((Cons) cons).lookup(sym);
            if (lookup != null) {
                return lookup;
            }
        }
        throw new IllegalArgumentException("Symbol " + sym + " not found in env");
    }

    public Env bind(SymbExpr sym, NancyExpr val) {
        return of(new Cons(new Cons(sym, val), cons));
    }

    @Override
    public String toString() {
        return "" + cons;
    }

}
