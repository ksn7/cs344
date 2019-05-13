% Kelsey Brouwer, CS 384 SP '19
% LPN Chapter 10 Practical Session

% Auto-generated
% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

% Your program goes here

% max - from LPN 10.2
% Non-cut
%max(X,Y,Y):-  X  =<  Y. 
%max(X,Y,X):-  X>Y.

% Green cut
%max(X,Y,Y)  :-  X  =<  Y,!. 
%max(X,Y,X)  :-  X>Y.

% Red cut
%max(X,Y,Z)  :-  X  =<  Y,!,  Y  =  Z. 
%max(X,Y,X).

% test queries
% max(2,3,3) should pass
% max(2,3,2) should fail


% Burger example - from LPN 10.3
% knowledge base
burger(X)  :-  big_mac(X). 
burger(X)  :-  big_kahuna_burger(X). 
burger(X)  :-  whopper(X).     
big_mac(a). 
big_mac(c).
big_kahuna_burger(b).  
whopper(d).

% cut-fail
%enjoys(vincent,X)  :-  big_kahuna_burger(X),!,fail. 
%enjoys(vincent,X)  :-  burger(X). 

% negation as failure (correct)
%enjoys(vincent,X)  :-  burger(X), 
%    \+  big_kahuna_burger(X).

% negation as failur (wrong)
enjoys(vincent,X)  :-  \+  big_kahuna_burger(X),  burger(X).

% example queries
% 

% Programming task 1
% yay symbols
%nu(X,Y):- \+ X=Y.

% No \+
%nu(X,Y):- X=Y, !, fail.
%nu(X,Y).

% No symbols
% FIXME: I don't get this one
%%nu(X,Y):- 

% Example queries
% nu(foo, foo) should fail
% nu(foo, blob) should pass
% nu(foo, X) should fail


% Programming task 2
% Imma come back to this
