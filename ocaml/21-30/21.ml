(* Insert an element at a given position into a list. (easy)

Start counting list elements with 0. If the position is larger or equal to the length of the list, insert the element at the end. (The behavior is unspecified if the position is negative.)
*)

let rec insert_at v i = function
  | [] -> [v]
  | x::xs -> if i = 0 then v::x::xs else x::(insert_at v (i-1) xs)

let _ = assert ((insert_at "alfa" 1 ["a";"b";"c";"d"]) = ["a"; "alfa"; "b"; "c"; "d"])
let _ = assert ((insert_at "alfa" 3 ["a";"b";"c";"d"]) = ["a"; "b"; "c"; "alfa"; "d"])
let _ = assert ((insert_at "alfa" 4 ["a";"b";"c";"d"]) = ["a"; "b"; "c"; "d"; "alfa"])

