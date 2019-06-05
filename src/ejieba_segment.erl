-module(ejieba_segment).

-export([init/0,cut/1,load_dict/2]).

init() ->
      ok = erlang:load_nif("priv/ejieba_segment", 0).

cut(_) ->
      "NIF library not loaded".

load_dict(_,_)->
	"NIF library not loaded".
