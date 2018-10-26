/*
Generate the combinations of K distinct objects chosen from the N elements of a list
    In how many ways can a committee of 3 be chosen from a group of 12 people? We all know that there 
    are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficients). For pure 
    mathematicians, this result may be great. But we want to really generate all the possibilities 
    (via backtracking).

    Example:
    ?- combination(3,[a,b,c,d,e,f],L).
    L = [a,b,c] ;
    L = [a,b,d] ;
    L = [a,b,e] ;
    ...
*/

collect(H, [H|T], T).
collect(X, [_|T], Cs) :- collect(X, T, Cs).

combination(0, _, []).
combination(K, Xs, [H|T]) :- 
  K > 0,
  collect(H, Xs, Zs),
  K1 is K - 1,
  combination(K1, Zs, T).


