% Calculating the area of a polygon

:- use_module(library(format)).

'urn:example:area'([_], 0).
'urn:example:area'([[A, B], [C, D]|E], F) :-
    'urn:example:area'([[C, D]|E], G),
    F is (A*D-B*C)/2+G.

% query
query('urn:example:area'([[3, 2], [6, 2], [7, 6], [4, 6], [5, 5], [5, 3], [3, 2]], _)).

run :-
    query(Q),
    Q,
    portray_clause(Q),
    fail;
    halt.