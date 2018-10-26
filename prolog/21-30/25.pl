/*
Generate a random permutation of the elements of a list.
    Example:
    ?- rnd_permu([a,b,c,d,e,f],L).
    L = [b,a,d,c,e,f]
*/

:- include('23').

rnd_permute(Xs, Ys) :- 
  length(Xs, L),
  rnd_select(Xs, L, Ys).
