% Kelsey Brouwer, CS 344 Exercise 12.2

% Part a
% part i

% 1. Unify
% 2. Not unify - although the single quotes make 'Bread' an atom, it is capitalized so I think it will not unify to bread
% 8. Unify, X = bread
% 9. Unify, X = sausage, Y = bread
% 14. Not unify, X would need to take two different values

% part ii
% 1. Not satisfied (house_elf is a predicate, not an atomic)
% 2. Not satisfied (harry is not in this knowledge base)
% 3. Not satisfied (wizard cannot be taken as an atomic, or if it can we know nothing about it)
% 4. Satisfied, assign X = 'McGonagall'
% 5. Satisfied, assign Hermione = hermione since with a capital H it is a variable. There are other solutions as well.


% Part b
% In a sense, inference in propositional logic uses unification because for some rules we need to unify atomics with their representations in other rules to gain the desired conclusion. For example, in modus ponens we in a sense unify A with the first part of 'A -> B' to get the conclusion B. However, there are no variables to unify, so it is easier to understand if we simply say the atomics much match in propositional logic for the inference rules to work.

% Part c
% Yes, Prolog inferencing uses resolution, because it will resolve items from its knowledge base to gain a conclusion.