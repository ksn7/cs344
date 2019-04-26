% Kelsey Brouwer, CS 344 Exercise 12.1

% Part a
% part i

killer(butch).
% killer is our predicate, and Butch is the object (atomic). Lowercase Butch so it is not a variable

married(mia, marsellus).
% married is the predicate, and Mia and Marsellus are atomics

dead(zed).
% predicate dead, atomic Zed

kills(marsellus, X):- givesFootmassage(X, mia).
% Here we need a variable X, and integrate it into an if-then statement

loves(mia, X):- goodDancer(X).
% again, X is a variable, but now goodDancer gives an attribute to its singular argument, which here is a variable

eats(jules, X):- nutritious(X); tasty(X).
% unique here is that the "if" portion of the statement is an "or", represented here by a semi-colon


% part ii

% 1. SWI Prolog responds "true." because it knows this to be true since it is a fact provided in the knowledge base
% 2. This fact is not in the knowledge base provided, so Prolog cannot infer if it is true, therefore it responds "false."
% 3. Since Hermione is not even mentioned in this knowledge base, Prolog knows nothing about her and will always respond "false." until it gains some knowledge about her.
% 4. See above
% 5. Prolog will respond "true." because it can infer this fact from the 2nd-4th lines of the knowledge base
% 6. Prolog will respond "false." because it doesnt know anything about the property witch, so there are no possible values for the variable Y.


% Part b
% Prolog implements modus ponens through the format "head :- body", where it can infer that "head" is true if "body" follows from the knowledge base provided. For example, if given "mortal(X):- man(X)" and "man(socrates)", Prolog would respond to "mortal(socrates)" with "true."

% Part c
% Horn clauses have the advantage over propositional logic that they can contain variables, which is important for Prolog. However, Horn clauses have some disadvantages, such as only implying one literal and not a conjunction of literals or anything else.

% Part d
% Prolog supports this distinction, since TELL would be a fact and ASK would be a query