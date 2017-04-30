(* Modified run-length encoding. (easy) 

Modify the result of the previous problem in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

Since OCaml lists are homogeneous, one needs to define a type to hold both single elements and sub-lists.
*)

type 'a rle =
  | One of 'a
  | Many of int * 'a


let collect xs = List.fold_left 
  (fun (c, cs, all) x -> if x = c then (c, x::cs, all) else (x, [x], cs::all)) 
  (List.hd xs, [], []) 
  xs

let pack = function 
  | []  -> []
  | [x] -> [[x]]
  | xs  -> let (_, ys, zs) = collect xs in List.rev (ys::zs)

let entuple xs = let len = List.length xs in
  if len = 1 then One (List.hd xs) else Many (len, List.hd xs)
  
let encode xs = List.map entuple (pack xs)

let _ = assert (
  (encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]) =
  [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d";
   Many (4, "e")])

