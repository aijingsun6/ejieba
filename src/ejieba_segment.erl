-module(ejieba_segment).

-on_load(init/0).

-export([cut/1]).

init() ->
  PrivDir = code:priv_dir(ejieba),
  ok = erlang:load_nif(filename:join(PrivDir, "ejieba_segment"), 0),
  JiebaF = filename:join([PrivDir,"dict","jieba.dict.utf8"]),
  ModF =  filename:join([PrivDir,"dict","hmm_model.utf8"]),
  ok = load_dict(JiebaF,ModF).

cut(_) ->
  "NIF library not loaded".

load_dict(_, _) ->
  "NIF library not loaded".
