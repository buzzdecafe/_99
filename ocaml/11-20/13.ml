(* Run-length encoding of a list (direct solution). (medium)

Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem "Pack consecutive duplicates of list elements into sublists", but only count them. As in problem "Modified run-length encoding", simplify the result list by replacing the singleton lists (1 X) by X.
*)


type 'a rle =
  | One of 'a
  | Many of int * 'a


let collect (c, n, zs) x =
  match zs with
  | [] -> (c, n, zs)
  | _  -> if   x = c 
          then (c, (n+1), (Many (n+1, c))::(List.tl zs))
          else (x, 1, (One x)::zs) 

(* encode : 'a list -> list rle *)
let encode = function
  | [] -> []
  | xs -> let x = List.hd xs in
          let (c, n, rs) = List.fold_left collect (x, 0, [One x]) xs in
          List.rev rs

let _ = assert (
  (encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"]) = 
  [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")])
