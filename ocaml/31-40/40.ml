(*
 * Truth tables for logical expressions. (medium)
 *
 * Generalize the previous problem in such a way that the 
 * logical expression may contain any number of logical 
 * variables. Define table in a way that table variables 
 * expr returns the truth table for the expression expr, 
 * which contains the logical variables enumerated in variables.
 *)
type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr

let rec eval vars = function
  | Var s      -> List.assoc s vars
  | Not e      -> not (eval vars e)
  | And (l, r) -> (eval vars l) && (eval vars r)
  | Or (l, r)  -> (eval vars l) || (eval vars r)

(* bind : (string * bool) list -> bool_expr -> string list -> (string * bool list) * bool) list *)
let rec bind ts expr = function
  | []    -> [(List.rev ts, eval ts expr)]
  | x::xs -> (bind ((x, true)::ts) expr xs) @ (bind ((x, false)::ts) expr xs)


let table vars expr = bind [] expr vars

let _ = assert ((table ["a"; "b"] (And(Var "a", Or(Var "a", Var "b")))) = 
  [([("a", true); ("b", true)], true); 
   ([("a", true); ("b", false)], true);
   ([("a", false); ("b", true)], false); 
   ([("a", false); ("b", false)], false)
  ]
)
let a = Var "a" and b = Var "b" and c = Var "c" in
  assert ((table ["a"; "b"; "c"] (Or(And(a, Or(b,c)), Or(And(a,b), And(a,c))))) =
    [
      ([("a", true) ; ("b", true) ; ("c", true) ], true );
      ([("a", true) ; ("b", true) ; ("c", false)], true );
      ([("a", true) ; ("b", false); ("c", true) ], true );
      ([("a", true) ; ("b", false); ("c", false)], false);
      ([("a", false); ("b", true) ; ("c", true) ], false);
      ([("a", false); ("b", true) ; ("c", false)], false);
      ([("a", false); ("b", false); ("c", true) ], false);
      ([("a", false); ("b", false); ("c", false)], false)
    ]
  )

