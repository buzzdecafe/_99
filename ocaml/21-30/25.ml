(* Generate a random permutation of the elements of a list. (easy)
*)

let shuffle a = for n = ((Array.length a) - 1) downto 0 do 
  Random.init(43799); 
  let k = Random.int (n + 1) in 
  let temp = a.(n) in 
  a.(n) <- a.(k); 
  a.(k) <- temp 
done 

let permutation xs = let a = Array.of_list xs in
  shuffle a;
  Array.to_list a

let _ = assert ((permutation ["a"; "b"; "c"; "d"; "e"; "f"]) = ["c"; "f"; "a"; "b"; "e"; "d"])


