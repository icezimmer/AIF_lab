parent(tom,bob).
parent(bob,ann).
parent(tom,jim).
parent(bob,asia).
parent(ann,sara).
parent(ann,vittorio).
parent(vittorio,lili).

ancestor(X,Y) :- parent(X,Y).

ancestor(X,Y) :-
parent(X,Z),
ancestor(Z,Y).