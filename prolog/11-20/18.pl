/*
Extract a slice from a list.
    Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

    Example:
    ?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
     L = [c,d,e,f,g]

*/

take(0, _, Acc, Ys) :- reverse(Acc, Ys).
take(N, [H|T], Acc, Ys) :- 
  N1 is N - 1,
  take(N1, T, [H|Acc], Ys).
  
drop(0, Xs, Xs).
drop(N, [_|T], Ys) :-
  N > 0,
  N1 is N - 1,
  drop(N1, T, Ys).

slice([], _, _, []).
slice(Xs, I, K, Zs) :- 
  K >= I,
  I1 is I - 1,
  KI is K - I,
  drop(I1, Xs, Ys),
  take(KI, Ys, [], Zs).

