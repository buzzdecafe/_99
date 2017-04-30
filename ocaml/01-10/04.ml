(* Find the number of elements of a list. (easy) *)

(* len : int -> 'a list -> int *)
let rec len acc = function
  | [] -> acc
  | x::xs -> len (acc + 1) xs

(* length : 'a list -> int *)
let length ls = len 0 ls
 
let _ = assert ((length [ "a" ; "b" ; "c"]) = 3)
let _ = assert ((length []) = 0)

