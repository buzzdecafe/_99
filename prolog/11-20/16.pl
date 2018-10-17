/*
Drop every N'th element from a list.
    Example:
    ?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
    X = [a,b,d,e,g,h,k]
*/

drop([], _, _, Acc, Zs) :- reverse(Acc, Zs).
drop([H|T], N, C, Acc, Zs) :- 
  C \= N,
  C1 is C + 1,
  drop(T, N, C1, [H|Acc], Zs).
drop([_|T], N, N, Acc, Zs) :- drop(T, N, 1, Acc, Zs).

drop([], _, []).
drop([H|T], N, Zs) :- drop([H|T], N, 1, [], Zs).

