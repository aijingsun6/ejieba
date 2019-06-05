#!/usr/bin/env escript
main(_) ->
 {ok,[[R]]} = init:get_argument(root),
 io:format("~ts",[R]).
