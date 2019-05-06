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

% knowledge base
tran(eins, one).
tran(zwei, two).
tran(drei, three).
tran(vier, four).
tran(fuenf, five).
tran(sechs, six).
tran(sieben, seven).
tran(act, eight).
tran(neun, nine).

% definition
listtran([], []).
listtran([HeadG|TailG], [HeadE|TailE]):- tran(HeadG, HeadE), listtran(TailG, TailE). 


% Part b
% Yes, Prolog can perform generalized modus ponens for first order logic. Given the following knowledge base (or one of a similar format)
mortal(X):- man(X).
man(socrates).
% Prolog will respond to the prompt "mortal(socrates)." with "true."