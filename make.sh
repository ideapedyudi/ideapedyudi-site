#!/bin/bash
SELF=`pwd`
ENVS=$SELF/envs
CONF=$SELF/src/config
OUT=$SELF/output
echo "ENVS = "$ENVS/env_$1.js
echo "CONFIG = "$CONF/

echo "Copy env.js to config"
cp $CONF/env.js $ENVS/env_default.js
cp $ENVS/env_$1.js $CONF/env.js

yarn install && yarn build && tar cvzf $OUT/$1-build.tar.gz ./build/*
cd $OUT && . $1.sh

rm $CONF/env.js
cp $ENVS/env_default.js $CONF/env.js

cd $SELF