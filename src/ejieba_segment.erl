-module(ejieba_segment).
-on_load(init/0).
-export([cut/1]).

init() ->
      ok = erlang:load_nif("priv/ejieba_segment", 0).

cut(_) ->
      "NIF library not loaded".