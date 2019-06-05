#include "erl_nif.h"
#include "include/MixSegment.hpp"

using namespace CppJieba;

extern "C"{

const MixSegment segment("dict/jieba.dict.utf8", "dict/hmm_model.utf8");

static ERL_NIF_TERM cut(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    enif_inspect_binary(env, argv[0], &bin);
    char *s = new char[bin.size + 1];
    memcpy(s, bin.data, bin.size);
    s[bin.size] = '\0';

    std::vector<std::string> words;
    segment.cut(s, words);

    ERL_NIF_TERM r = enif_make_list(env, 0);
    ErlNifBinary h;
    size_t len;

    for(std::vector<std::string>::iterator i = words.begin(); i != words.end(); ++i) {
        len = strlen(i->c_str());
        enif_alloc_binary(len, &h);
        memcpy(h.data, i->c_str(), len);
        r = enif_make_list_cell(env, enif_make_binary(env, &h), r);
    }

    ERL_NIF_TERM result;
    enif_make_reverse_list(env, r, &result);
    return result;
}

static ErlNifFunc nif_funcs[] =
{
    {"cut", 1, cut}
};
}
ERL_NIF_INIT(ejieba_segment, nif_funcs, NULL, NULL, NULL, NULL)
