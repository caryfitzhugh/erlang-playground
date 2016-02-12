%% This is the game. It is WAR
%%

-module(game).
-export([play/0]).
-import(cards, [shuffle/1, get_deck/0, deal_in/2]).

%%% Ask how many players would like to play... 2 - 52
play() ->
  Deck = cards:shuffle(cards:get_deck()),
  {ok, [Players]} = io:fread("Welcome to WAR.  How many players would you like to involve? (2-52): ", "~d"),
  io:format("Ok! Starting the game with ~B players~n", [Players]),
  Hands = cards:deal_in(Deck, Players),
  Winner = play_game(Hands),
  io:format("Winner is Player #~B!!~n", [Winner])
  .

play_game(Hands) ->
  1
  .

play_turn(Hands) ->
  1
  .
