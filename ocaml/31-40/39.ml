(* Truth tables for logical expressions (2 variables). (medium)
 *
 * Define a function, table2 which returns the truth table of a 
 * given logical expression in two variables (specified as arguments). 
 * The return value must be a list of triples containing (value_of_a, 
 * value_of_b, value_of_expr).
 *)

type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr

let rec eval a b bindA bindB = function
  | Var s -> if s = a then bindA else bindB
  | Not be -> not (eval a b bindA bindB be)
  | And (l, r) -> (eval a b bindA bindB l) && (eval a b bindA bindB r)
  | Or (l, r) -> (eval a b bindA bindB l) || (eval a b bindA bindB r)

let table2 a b expr = 
  [(true, true, (eval a b true true expr))]
  @ [(true, false, (eval a b true false expr))]
  @ [(false, true, (eval a b false true expr))]
  @ [(false, false, (eval a b false false expr))]


let _ = assert ((table2 "a" "b" (And(Var "a", Or(Var "a", Var "b")))) =
  [(true, true, true); (true, false, true); (false, true, false);
   (false, false, false)])

