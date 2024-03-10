// Generated from Nancy.g4 by ANTLR 4.13.1

    package gr.cons.nancy.parser;

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link NancyParser}.
 */
public interface NancyListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link NancyParser#prog}.
	 * @param ctx the parse tree
	 */
	void enterProg(NancyParser.ProgContext ctx);
	/**
	 * Exit a parse tree produced by {@link NancyParser#prog}.
	 * @param ctx the parse tree
	 */
	void exitProg(NancyParser.ProgContext ctx);
	/**
	 * Enter a parse tree produced by {@link NancyParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(NancyParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link NancyParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(NancyParser.ExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link NancyParser#type_expr}.
	 * @param ctx the parse tree
	 */
	void enterType_expr(NancyParser.Type_exprContext ctx);
	/**
	 * Exit a parse tree produced by {@link NancyParser#type_expr}.
	 * @param ctx the parse tree
	 */
	void exitType_expr(NancyParser.Type_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link NancyParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(NancyParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link NancyParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(NancyParser.TypeContext ctx);
}