(* Extract a given number of randomly selected elements from a list. (medium)

The selected items shall be returned in a list. We use the Random module but do not initialize it with Random.self_init for reproducibility.
*)


let rec rand_select xs = function
  | 0 -> []
  | n -> let _ = Random.init(43179) in
         let i = Random.int ((List.length xs) - 1) in
         let x = List.nth xs i in
         x::(rand_select (List.tl xs) (n-1))

let _ = assert ((rand_select ["a";"b";"c";"d";"e";"f";"g";"h"] 3) = ["c"; "g"; "d"])

