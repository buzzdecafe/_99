(* Sorting a list of lists according to length of sublists. (medium)
 *
 * We suppose that a list contains elements that are lists themselves. The objective is to sort the elements of this list according to their length. E.g. short lists first, longer lists later, or vice versa.
 *
 * Again, we suppose that a list contains elements that are lists themselves. But this time the objective is to sort the elements of this list according to their length frequency; i.e., in the default, where sorting is done ascendingly, lists with rare lengths are placed first, others with a more frequent length come later.
 *)

let length_sort = List.sort (fun a b -> (List.length a) - (List.length b)) 

let _ = assert ((length_sort [ ["a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; ["d";"e"];
                               ["i";"j";"k";"l"]; ["m";"n"]; ["o"]]) =
                             [ ["o"]; ["d"; "e"]; ["d"; "e"]; ["m"; "n"]; ["a"; "b"; "c"]; 
                               ["f"; "g"; "h"]; ["i"; "j"; "k"; "l"]])


module Freq = Map.Make(struct type t = int let compare = compare end)
let frequency_sort xs = 
  List.fold_left 
    (fun m ls ->  
      let len = List.length ls in
      try let zs = Freq.find len m in Freq.add len (ls::zs) m
      with Not_found -> Freq.add len [ls] m
    ) Freq.empty xs
    |> Freq.bindings 
    |> List.map snd
    |> List.sort (fun a b -> (List.length a) - (List.length b))
    |> List.fold_left (fun acc ws -> acc @ ws) []

let _ = assert ((frequency_sort [ ["a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; ["d";"e"];
                                  ["i";"j";"k";"l"]; ["m";"n"]; ["o"]]) = 
                                [ ["o"]; ["i"; "j"; "k"; "l"]; ["f"; "g"; "h"]; ["a"; "b"; "c"]; 
                                  ["m"; "n"]; ["d"; "e"]; ["d"; "e"]])


