(* Pack consecutive duplicates of list elements into sublists. (medium) *)

let collect xs = List.fold_left 
  (fun (c, cs, all) x -> if x = c then (c, x::cs, all) else (x, [x], cs::all)) 
  (List.hd xs, [], []) 
  xs


(* pack : 'a list -> 'a list list *)
let pack = function 
  | []  -> []
  | [x] -> [[x]]
  | xs  -> let (_, ys, zs) = collect xs in List.rev (ys::zs)



let _ = assert (
  (pack ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"d";"e";"e";"e";"e"]) =
  [["a"; "a"; "a"; "a"]; ["b"]; ["c"; "c"]; ["a"; "a"]; ["d"; "d"];
   ["e"; "e"; "e"; "e"]])
