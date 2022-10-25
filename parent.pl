parent(tom,bob).
parent(bob,ann).
parent(tom,jim).
parent(bob,asia).

grandparent(X,Y) :-
parent(X,Z),
parent(Z,Y).le