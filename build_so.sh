#! /bin/bash

ERL_ROOT=`escript get_erl_root.escript`
BASE_NAME=`basename $1 | cut -d '.' -f 1`
g++ -fPIC -shared -o priv/${BASE_NAME}.so c_src/${BASE_NAME}.cpp -I $ERL_ROOT/usr/include/
