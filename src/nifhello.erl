-module(nifhello).

-export([init/0, hello/0]).

init() ->
      erlang:load_nif("priv/nifhello", 0).

hello() ->
      "NIF library not loaded".
