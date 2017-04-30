(* Reverse a list. (easy) *)

(* rev : 'a list -> 'a list *)
let rec rev = function
  | [] -> []
  | x::xs -> (rev xs) @ [x]

let _ = assert ((rev ["a" ; "b" ; "c"]) = ["c"; "b"; "a"])

