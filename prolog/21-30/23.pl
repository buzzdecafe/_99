/*
Extract a given number of randomly selected elements from a list.
    The selected items shall be put into a result list.
    Example:
    ?- rnd_select([a,b,c,d,e,f,g,h],3,L).
    L = [e,d,a]

    Hint: Use the built-in random number generator random/2 and the result of problem 1.20.

    n.b. swipl does not have random/2, using random_between/3 instead
*/

:- include('../11-20/20').

rs(_, 0, Ys, Ys).
rs(Xs, N, Acc, Ys) :- 
  N > 0,
  length(Xs, L),
  random_between(1, L, Idx),
  remove_at(X, Xs, Idx, T),
  N1 is N - 1,
  rs(T, N1, [X|Acc], Ys).


rnd_select([], _, []).
rnd_select(Xs, N, Ys) :- rs(Xs, N, [], Ys).
