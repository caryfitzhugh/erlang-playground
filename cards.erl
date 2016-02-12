%% Here I am making a deck of cards game in erlang.
%% Who would have thought?
%%
-module(cards).
-export([get_deck/0,
         shuffle/1]).

get_deck() ->
  [{Suit, Num} || Suit <- [hearts, diamonds, clubs, spades], Num <- [ace,1,2,3,4,5,6,7,8,9,10,jack,queen,king]].

shuffle(Deck) ->
  lists:sort(fun(_,_) ->
               random:uniform() > 0.5
             end, Deck).
