
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
 
 (* rev : 'a list -> 'a list *)
let rec rev = function
  | [] -> []
  | x::xs -> (rev xs) @ [x]

let is_palindrome xs = rev xs = xs
 type 'a node = 
  | One of 'a
  | Many of 'a node list
 
let rec flatten = function
  | []    -> []
  | x::xs -> match x with
          | One y   -> y :: (flatten xs)
          | Many ys -> (flatten ys) @ (flatten xs)
 
let compress = function
  | [] -> []
  | [x] -> [x]
  | x::y::xs -> if x = y then compress (y::xs) else x::(compress (y::xs))


let rec takeWhile f = function
  | [] -> []
  | x::xs -> if f x then  x::(takeWhile f xs) else []

let rec pack = function
  | [] -> []
  | x::y::xs -> if x = y then x::(pack y::xs) else 

