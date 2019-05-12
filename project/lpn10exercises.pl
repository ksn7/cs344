% Kelsey Brouwer, CS 344 SP '19
% LPN Chapter 10 Exercises

% 10.1
% p(X).: X=1; X=2; no.
% p(X),p(Y).: X=1, Y=1; X=1, Y=2;
%    X=2, Y=1; X=2, Y=2; no.
% p(X),!,p(Y).: X=1, Y=1; X=1, Y=2; no.

p(1).
p(2):- !.
p(3).


% 10.2
%class(Number,positive):- Number>0.
%class(0,zero). 
%class(Number,negative):- Number<0.

% This program classifies numbers as 
%   positive, zero, or negative. It first
%   evaluates if it is positive, then 0,
%   then negative.

% For mine, change order to add 2 green cuts
class(Number, positive):- Number > 0, !.
class(Number, negative):- Number < 0, !.
class(0, zero).

% 10.3 - incomplete
%split([], P, N).
%split(
         
         
         
% 10.4 - incomplete
directTrain(saarbruecken, dudweiler).
directTrain(dudweiler, saarbruecken).
directTrain(forbach, saarbruecken).
directTrain(saarbruecken, forbach).
directTrain(freyming, forbach).
directTrain(forbach, freyming).
directTrain(stAvold, freyming).
directTrain(freyming, stAvold).
directTrain(fahlquemont, stAvold).
directTrain(stAvold, fahlquemont).
directTrain(metz, fahlquemont).
directTrain(fahlquemont, metz).
directTrain(nancy, metz).
directTrain(metz, nancy).

route(X,Y, Route):- directTrain(X,Y), 
    Route = [X, Y], !.
route(X,Y, Route):- route(X,Z,Route),
    route(Z,Y, Route).


% 10.5
jealous(X,Y):- loves(X,Z), loves(Y,Z),
    \+ X = Y.

loves(vincent, mia).
loves(marsellus, mia).


