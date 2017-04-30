(* Write a function last : 'a list -> 'a option that returns the last element of a list. (easy) *)

(* last : 'a list -> 'a option *)
let rec last = function
  | [] -> None
  | [x] -> Some x
  | x::xs -> last xs


let _ = assert ((last ["a"; "b"; "c"; "d"]) = Some "d");;
let _ = assert ((last []) = None)

