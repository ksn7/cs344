% Kelsey Brouwer, CS 344 SP '19
% LPN Chapter 10 Exercise 10.4
         
% 10.4 knowledge base - provided
directTrain(saarbruecken, dudweiler).
directTrain(forbach, saarbruecken).
directTrain(freyming, forbach).
directTrain(stAvold, freyming).
directTrain(fahlquemont, stAvold).
directTrain(metz, fahlquemont).
directTrain(nancy, metz).
% new stuff - add it as info here. Not
% sure why adding a reversing function
% doesn't work. Ex) solutions time out
% on directTrain(A,B):- directTrain(B,A).
directTrain(dudweiler, saarbruecken).
directTrain(saarbruecken, forbach).
directTrain(forbach, freyming).
directTrain(freyming, stAvold).
directTrain(stAvold, fahlquemont).
directTrain(fahlquemont, metz).
directTrain(metz, nancy).

% append list function taken from
% LPN 6.1, used in calculating route
% to avoid nested lists.
append([],L,L).
append([H|T],L2,[H|L3]):- append(T,L2,L3).

% member list function taken from
% LPN 4.2, used in calculating route
% to avoid revisiting cities.
member(X,[X|_]).
member(X,[_|T]):- member(X,T).

% 3.3 Exercise
travelFromTo(X,Y):- directTrain(X,Y).
travelFromTo(X,Z):- travelFromTo(X,Y),
    travelFromTo(Y,Z).


% new code

% This cut ensures only one solution
%    is searched for
route1(X,Y,Visited,Route):- directTrain(X,Y),
    \+ member(X, Visited),
    Route=[X,Y], !.
% The \+ cut removes solutions where the city has
% already been visited to prevent cycles.
% The cut on the end finds only one solution.
route1(X,Z,Visited,Route):- \+ member(X, Visited),
    directTrain(X,Y),
    route1(Y, Z, [X|Visited], RouteTail), 
    append([X], RouteTail, Route),
    !.

% Adding separate route predicate that calls route1
% because the Visited argument allows me to remove
% cycles from graphs.
route(X,Y,Route):- Visited=[], route1(X,Y,Visited,Route).


