% Deontic Logic example

:- use_module(library(between)).
:- use_module(library(format)).

% Facts about what employees are doing
'urn:example:prepare'(X, Y) :-
    Z is Y//3,
    between(X, Z, N),
    number_codes(N, J),
    atom_codes(I, J),
    atom_concat('urn:example:alice', I, A),
    assertz('urn:example:does'(A, 'urn:example:log_off_at_end_of_shift')),
    atom_concat('urn:example:bob', I, B),
    assertz('urn:example:does'(B, 'urn:example:work_related_task')),
    assertz('urn:example:does'(B, 'urn:example:log_off_at_end_of_shift')),
    atom_concat('urn:example:carol', I, C),
    assertz('urn:example:does'(C, 'urn:example:access_social_media')),
    fail;
    true.

% Rules to check if an action complies with deontic logic
'urn:example:complies'(Person, true) :-
    'urn:example:does'(Person, 'urn:example:work_related_task'),
    'urn:example:does'(Person, 'urn:example:log_off_at_end_of_shift').

'urn:example:complies'(Person, false) :-
    'urn:example:does'(Person, 'urn:example:work_related_task'),
    \+'urn:example:does'(Person, 'urn:example:log_off_at_end_of_shift').

'urn:example:complies'(Person, true) :-
    'urn:example:does'(Person, 'urn:example:log_off_at_end_of_shift').

'urn:example:complies'(Person, false) :-
    'urn:example:does'(Person, 'urn:example:access_social_media').


% prepare data for 10000 employees
query('urn:example:prepare'(1, 10000)).

% Query to test if everyone complies with deontic logic
query('urn:example:complies'(_, _)).

run :-
    query(Q),
    Q,
    portray_clause(Q),
    fail;
    halt.