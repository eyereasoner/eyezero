% Examples of universal statements

:- use_module(library(format)).

% Every x: type(x, Resource)
'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'(_, 'http://www.w3.org/2000/01/rdf-schema#Resource').

% Everybody loves somebody who is lonely
'urn:example:loves'(A, 'urn:example:Lonely'(skolem(A))).

% queries
query('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'('urn:example:Pat', 'http://www.w3.org/2000/01/rdf-schema#Resource')).
query('urn:example:loves'('urn:example:Bob', _)).

run :-
    query(Q),
    Q,
    portray_clause(Q),
    fail;
    halt.