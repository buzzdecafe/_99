/*
Rotate a list N places to the left.
    Examples:
    ?- rotate([a,b,c,d,e,f,g,h],3,X).
    X = [d,e,f,g,h,a,b,c]

    ?- rotate([a,b,c,d,e,f,g,h],-2,X).
    X = [g,h,a,b,c,d,e,f]

    Hint: Use the predefined predicates length/2 and append/3, as well as the result of problem 1.17.
*/

:- include('17').

rotate([], _, []).
rotate(Xs, N, Zs) :- 
  N >= 0,
  take(N, Xs, [], NewEnd),
  drop(N, Xs, NewBegin),
  append(NewBegin, NewEnd, Zs).
  
rotate(Xs, N, Zs) :-
  N < 0,
  length(Xs, L),
  N1 is L + N,
  rotate(Xs, N1, Zs).
