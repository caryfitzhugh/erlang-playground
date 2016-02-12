%% Here I am making a deck of cards game in erlang.
%% Who would have thought?
%%
-module(cards).
-export([get_deck/0,
         shuffle/1,
         deal_in/2]).

get_deck() ->
  [{Suit, Num} || Suit <- [hearts, diamonds, clubs, spades], Num <- [ace,1,2,3,4,5,6,7,8,9,10,jack,queen,king]].

shuffle(Deck) ->
  lists:sort(fun(_,_) ->
               random:uniform() > 0.5
             end, Deck).

create_hands( 0 ) -> [];
create_hands( N ) when N > 0 -> [ [] | create_hands( N-1 ) ].

deal([], Hands)  -> Hands;
deal(Deck, Hands) when length(Deck) > 0 ->
  %% You want to add one pull from the deck to each of the hands
  %% and keep dealing.
  {CardsForRound, Rest} = lists:split(length(Hands), Deck),

  %% Add the takens to each of the Hands
  {NewHands, _} = lists:mapfoldl(fun(Hand, CardRound) -> {[hd(CardRound) | Hand], tl(CardRound)} end, CardsForRound, Hands),

  %% Keep dealing with the rest of the deck (if there are no more cards, it'll hit the base match
  %% And just return "Hands"
  deal(Rest, NewHands)
  .


%% Deal all the players into the game
deal_in(Deck, Players) ->
  EmptyHands = create_hands(Players),
 deal(Deck, EmptyHands)
  .
