/*
 Duplicate the elements of a list a given number of times.
    Example:
    ?- dupli([a,b,c],3,X).
    X = [a,a,a,b,b,b,c,c,c]

    What are the results of the goal:
    ?- dupli(X,3,Y).
*/

nx(0, _, Acc, Acc).
nx(N, X, Acc, Xs) :- 
  N > 0,
  N1 is N-1,
  nx(N1, X, [X|Acc], Xs).

dupli([], _, Acc, Ys) :- reverse(Acc, Ys).
dupli([H|T], N, Acc, Ys) :-
  nx(N, H, [], Zs),
  flatten([Zs|Acc], As),
  dupli(T, N, As, Ys).

dupli([], _, []).
dupli(_, 0, []).
dupli([H|T], N, Ys) :- 
  nx(N, H, [], Zs),
  dupli(T, N, Zs, Ys).

