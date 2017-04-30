(* Flatten a nested list structure. (medium) *)

type 'a node =
  | One of 'a 
  | Many of 'a node list

(* flatten 'a node list -> 'a list *)
let rec flatten = function
  | []    -> []
  | x::xs -> match x with
          | One y   -> y :: (flatten xs)
          | Many ys -> (flatten ys) @ (flatten xs)

let _ = assert (
  (flatten [One "a"; Many [One "b"; Many [One "c"; One "d"]; One "e"]]) = 
    ["a"; "b"; "c"; "d"; "e"])
