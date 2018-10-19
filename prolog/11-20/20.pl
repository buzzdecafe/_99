/*
Remove the K'th element from a list.
    Example:
    ?- remove_at(X,[a,b,c,d],2,R).
    X = b
    R = [a,c,d]
*/

remove_at(X, [X|T], 1, Seen, Zs) :- 
  reverse(Seen, Rs), 
  append(Rs, T, Zs). 
remove_at(X, [H|T], N, Seen, Zs) :-
  N1 is N - 1,
  remove_at(X, T, N1, [H|Seen], Zs).

remove_at(_, [], _, []).
remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], N, Zs) :-
  N > 1,  
  N1 is N - 1,
  remove_at(X, T, N1, [H], Zs).





