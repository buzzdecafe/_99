(* Run-length encoding of a list. (easy) *)

let collect xs = List.fold_left 
  (fun (c, cs, all) x -> if x = c then (c, x::cs, all) else (x, [x], cs::all)) 
  (List.hd xs, [], []) 
  xs

let pack = function 
  | []  -> []
  | [x] -> [[x]]
  | xs  -> let (_, ys, zs) = collect xs in List.rev (ys::zs)

let encode xs = List.map (fun ls -> (List.length ls, List.hd ls)) (pack xs)

let _ = assert (
  (encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]) = 
  [(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")])
