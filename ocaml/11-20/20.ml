(* Remove the K'th element from a list. (easy)

The first element of the list is numbered 0, the second 1,...
*)

let rec remove_at n = function
  | [] -> []
  | x::xs -> if n = 0 then xs else x::(remove_at (n-1) xs)


let _ = assert ((remove_at 1 ["a";"b";"c";"d"]) = ["a"; "c"; "d"])

