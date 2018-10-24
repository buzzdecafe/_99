/*
Insert an element at a given position into a list.
    Example:
    ?- insert_at(alfa,[a,b,c,d],2,L).
    L = [a,alfa,b,c,d]
*/


ins(X, [H|T], 1, Pre, Ys) :- 
  reverse(Pre, Ps),
  append(Ps, [X, H | T], Ys).
ins(X, [H|T], N, Pre, Ys) :- 
  N > 1,
  N1 is N - 1,
  ins(X, T, N1, [H|Pre], Ys).

insert_at(X, Xs, 1, [X|Xs]).
insert_at(X, [H|T], N, Ys) :- 
  N > 1,
  ins(X, [H|T], N, [], Ys).

