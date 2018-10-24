/*
 Create a list containing all integers within a given range.
    Example:
    ?- range(4,9,L).
    L = [4,5,6,7,8,9]
*/

range(X, X, Acc, Xs) :- reverse([X|Acc], Xs).
range(Lo, Hi, Acc, Xs) :- 
  Lo < Hi,
  L1 is Lo + 1,
  range(L1, Hi, [Lo|Acc], Xs).

range(X, X, [X]).
range(Lo, Hi, Xs) :- range(Lo, Hi, [], Xs).
