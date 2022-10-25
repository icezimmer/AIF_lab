/* Facts */
man(dr_black).
man(reverend_green).
man(colonel_mustard).
man(professor_plum).

woman(mrs_peacock).
woman(madame_rose).
woman(miss_scarlett).
woman(mrs_white).

victim(dr_black).

playing_cards(colonel_mustard).
playing_cards(reverend_green).
playing_cards(mrs_peacock).

gardening(mrs_white).
gardening(reverend_green).

played_golf(professor_plum).
played_golf(colonel_mustard).

smoker(miss_scarlett).
smoker(colonel_mustard).
smoker(mrs_white).
smoker(dr_black).
smoker(mrs_peacock).

room(room_21).
room(room_22).
room(room_23).
room(room_24).
room(room_25).

stay_in(dr_black,room_22).
stay_in(reverend_green,room_24).
stay_in(miss_scarlett,room_21).
stay_in(colonel_mustard,room_24).
stay_in(professor_plum,room_22).
stay_in(mrs_peacock,room_23).
stay_in(madame_rose,room_21).
stay_in(mrs_white,room_23).

owns_revolver(reverend_green).
owns_revolver(colonel_mustard).
owns_revolver(madame_rose).

/* TODO: Write your rules to solve the crime */

/* a OR b ==> (a; b) */
persona(X) :-
(man(X); woman(X)).

suspect(X) :-
persona(X), 
\+ victim(X).

has_alibi(X) :-
suspect(X),
playing_cards(X).

outside_once(X) :-
(gardening(X); played_golf(X); smoker(X)).

/*doesn't need to define R in input */
share_room(X,Y) :-
X \= Y,
room(R),
stay_in(X,R),
stay_in(Y,R).

access_revolver(X) :-
(owns_revolver(X);
(share_room(X,Y),
owns_revolver(Y))).

murderer(X) :-
suspect(X),
\+has_alibi(X),
outside_once(X),
access_revolver(X).