(* Decode a run-length encoded list. (medium)

Given a run-length code list generated as specified in the previous problem, construct its uncompressed version.
*)

type 'a rle =
  | One of 'a
  | Many of int * 'a

let rec toList = function
  | One x -> [x]
  | Many (0, s) -> []
  | Many (n, s) -> s::(toList (Many ((n-1), s)))

let decode xs = List.concat (List.map toList xs)

let _ = assert (
  (decode [Many (4,"a"); One "b"; Many (2,"c"); Many (2,"a"); One "d"; Many (4,"e")]) =
  ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"])


