(* Huffman code (hard)
 *
 * First of all, consult a good book on discrete mathematics or algorithms for a
 * detailed description of Huffman codes (you can start with the Wikipedia
 * page)
 *
 * We consider a set of symbols with their frequencies. For example, if the
 * alphabet is "a",..., "f" (represented as the positions 0,...5) and respective
 * frequencies are 45, 13, 12, 16, 9, 5:
 *
 * let fs = [ ("a", 45); ("b", 13); ("c", 12); ("d", 16); ("e", 9); ("f", 5) ];;
 * val fs : (string * int) list = [("a", 45); ("b", 13); ("c", 12); ("d", 16);
 * ("e", 9); ("f", 5)]
 *
 * Our objective is to construct the Huffman code c word for all symbols s. In our
 * example, the result could be hs = [("a", "0"); ("b", "101"); ("c", "100"); ("d",
 * "111"); ("e", "1101"); ("f", "1100")] (or hs = [ ("a", "1");...]). The task
 * shall be performed by the function huffman defined as follows: huffman(fs)
 * returns the Huffman code table for the frequency table fs
 *)

type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree

(* first sort in nondecreasing order by freq *)
let sorted = List.sort (fun (_, a) (_, b) -> a - b) 

let prefix s b = s ^ b

let toTree t = function
  | [] -> t
  | [x] -> t
  | x::y::xs -> t



let rec huffman fs = 
  let t = toTree Empty (sorted fs) in
  huffmanize t




let fs = [ ("a", 45); ("b", 13); ("c", 12); ("d", 16); ("e", 9); ("f", 5) ];;
let _ = assert ((huffman fs) = [("a", "0"); ("c", "100"); ("b", "101"); 
                                ("f", "1100"); ("e", "1101"); ("d", "111")]) 
let _ = assert ((huffman ["a", 10;  "b", 15;  "c", 30;  "d", 16;  "e", 29]) =
    [("d", "00"); ("a", "010"); ("b", "011"); ("e", "10"); ("c", "11")])

