% Kelsey Brouwer, CS 344 SP 2019
% Exercise 13.1

% Part a
% part i

% knowledge base
directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).

% definition
in(X, Y):- directlyIn(X, Y).
in(X, Z):- directlyIn(X, Y), in(Y, Z).

% part ii
tran(eins, one).
tran(zwei, two).
tran(drei, three).
tran(vier, four).
tran(fuenf, five).
tran(sechs, six).
tran(sieben, seven).
tran(act, eight).
tran(neun, nine).

listtran(G, E):- 

listtran([], E):- 