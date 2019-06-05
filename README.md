# 分词库
### links
- [libcppjieba](https://github.com/yanyiwu/libcppjieba.git)
- [exjieba](https://github.com/falood/exjieba.git)

###  用法
```
rebar compile

erl -pa ebin

L = ejieba_segment:cut( unicode:characters_to_binary("xxx") ).

% L:: [ Bin]
```