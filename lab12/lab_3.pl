% Kelsey Brouwer, CS 344 Exercise 12.3

% To make it easier on me, I will refer to the suspected witch as Jane

madeOfWood(X):- weighsSameAsDuck(X).
burns(X):- madeOfWood(X).
witch(X):- burns(X).
weighsSameAsDuck(jane).