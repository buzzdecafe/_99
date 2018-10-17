/*
Split a list into two parts; the length of the first part is given.
    Do not use any predefined predicates.

    Example:
    ?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
    L1 = [a,b,c]
    L2 = [d,e,f,g,h,i,k]
*/

% not using defined `reverse` predicate ...
rev([], Acc, Acc).
rev([H|T], Acc, Ys) :- rev(T, [H|Acc], Ys).

take(0, _, Acc, Ys) :- rev(Acc, [], Ys).
take(N, [H|T], Acc, Ys) :- 
  N1 is N - 1,
  take(N1, T, [H|Acc], Ys).
  
drop(0, Xs, Xs).
drop(N, [_|T], Ys) :-
  N > 0,
  N1 is N - 1,
  drop(N1, T, Ys).

split([], _, [], []). % error?
split(Xs, N, L1, L2) :-
  take(N, Xs, [], L1),
  drop(N, Xs, L2).

