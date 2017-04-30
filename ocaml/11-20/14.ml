(* Duplicate the elements of a list. (easy) *)


let dupe x = [x; x]

let duplicate xs = List.map dupe xs |> List.concat


let _ = assert (
  (duplicate ["a";"b";"c";"c";"d"]) =
  ["a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"; "d"; "d"])

