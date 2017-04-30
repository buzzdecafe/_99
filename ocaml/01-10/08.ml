(* Eliminate consecutive duplicates of list elements. (medium) *)

(* compress : 'a list -> 'a list *)
let rec compress = function
  | [] -> []
  | [x] -> [x]
  | x::y::xs -> if x = y then compress (y::xs) 
                else x::(compress (y::xs))

let _ = assert (
  (compress ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]) =
    ["a"; "b"; "c"; "a"; "d"; "e"])
