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
% new stuff - add it as info here b/c 
%    otherwise the recursive stuff
%    doesn't work? Maybe should figure
%    that out
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
member(X,[X|T]).
member(X,[H|T]):- member(X,T).

% 3.3 Exercise
travelFromTo(X,Y):- directTrain(X,Y).
travelFromTo(X,Z):- travelFromTo(X,Y),
    travelFromTo(Y,Z).

% new code
% FIXME: works only in one direction, 
%    can't figure out how to not
%    revisit cities

% This cut ensures only one solution
%    is searched for
route(X,Y, Route):- directTrain(X,Y),
    Route=[X,Y], !.
% This cut ensures one solution, but not sure
% that the member part is working correctly.
route(X,Z, Route):- directTrain(X,Y),
    route(Y, Z, RouteTail), 
    append([X], RouteTail, Route),
    \+ member(X, RouteTail),
    !.



