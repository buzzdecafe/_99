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

(* TODO *)
let frequency_sort xs = List.fold_left 

let _ = assert ((frequency_sort [ ["a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; ["d";"e"];
                                  ["i";"j";"k";"l"]; ["m";"n"]; ["o"]]) = 
                                [ ["i"; "j"; "k"; "l"]; ["o"]; ["a"; "b"; "c"]; ["f"; "g"; "h"];
                                  ["d"; "e"];["d"; "e"]; ["m"; "n"]])


