/*
P07 (**) Flatten a nested list structure.
    Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

    Example:
    ?- my_flatten([a, [b, [c, d], e]], X).
    X = [a, b, c, d, e]

    Hint: Use the predefined predicates is_list/1 and append/3
*/

my_flatten([], []).
my_flatten([H|T], Xs) :- (
  is_list(H),
  my_flatten(H, Hs),
  my_flatten(T, Ts),
  append(Hs, Ts, Xs)
) ; (
  my_flatten(T, Ts),
  append([H], Ts, Xs)
).
