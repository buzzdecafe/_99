(* Lotto: Draw N different random numbers from the set 1..M. (easy)

The selected numbers shall be returned in a list.
*)



let rec lotto_assert n r = 
  let s = Set.Make(int)

  match n with
  | 0 -> []
  | _ -> 

let _ = assert ((lotto_select 6 49) = [10; 20; 44; 22; 41; 2])

