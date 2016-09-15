
(* last : 'a list -> 'a option *)
let rec last = function
  | [] -> None
  | [x] -> Some x
  | x::xs -> last xs

  (* last ["a"; "b"; "c"; "d"] = Some "d"
   * last [] = None
   *)

(* last_two : 'a list -> ('a * 'a) option *)
let rec last_two = function
  | [] -> None
  | [x] -> None
  | [x; y] -> Some (x, y)
  | x::xs -> last_two xs

  (* last_two [ "a" ; "b" ; "c" ; "d" ] = Some ("c", "d")
   * last_two [ "a" ] = None
   *)

let rec at n = function
  | [] -> None
  | x::xs -> if n = 1 then Some x else at (n - 1) xs
;;

let rec len acc = function
  | [] -> acc
  | x::xs -> len (acc + 1) xs

let length ls = len 0 ls
 
