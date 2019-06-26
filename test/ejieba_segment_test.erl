-module(ejieba_segment_test).
-author('alking').

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
  L = ejieba_segment:safe_cut("小明硕士毕业于中国科学院计算所"),
  ML = ["小明", "硕士", "毕业", "于", "中国科学院", "计算所"],
  ML2 = lists:map(fun(X) -> unicode:characters_to_binary(X) end, ML),
  L = ML2.



