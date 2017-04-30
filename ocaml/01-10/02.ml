(* Find the last but one (last and penultimate) elements of a list. (easy) *)

(* last_two : 'a list -> ('a * 'a) option *)
let rec last_two = function
  | [] -> None
  | [x] -> None
  | [x; y] -> Some (x, y)
  | x::xs -> last_two xs

let _ = assert ((last_two [ "a" ; "b" ; "c" ; "d" ]) = Some ("c", "d"))
let _ = assert ((last_two [ "a" ]) = None)
