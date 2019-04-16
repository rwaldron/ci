#!/usr/bin/env bash

git clone https://github.com/devsnek/engine262.git;
cd engine262 && npm install && npm run build && npm link;
cd $TRAVIS_BUILD_DIR;

npm install -g jsvu eshost-cli

# npm install --ignore-scripts && npm link;

export PATH="${HOME}/.jsvu:${PATH}";

echo $PATH;

jsvu --os=linux64 --engines=all;

export ESHOST_PATH_CHAKRA=`which chakra`;
export ESHOST_PATH_ENGINE262=`which engine262`;
export ESHOST_PATH_JAVASCRIPTCORE=`which javascriptcore`;
export ESHOST_PATH_SPIDERMONKEY=`which spidermonkey`;
export ESHOST_PATH_V8=`which v8`;
export ESHOST_PATH_XS=`which xs`;

eshost --add "chakra" ch $ESHOST_PATH_CHAKRA;
eshost --add "engine262" engine262 $ESHOST_PATH_ENGINE262;
eshost --add "javascriptcore" jsc $ESHOST_PATH_JAVASCRIPTCORE;
eshost --add "spidermonkey" jsshell $ESHOST_PATH_SPIDERMONKEY;
eshost --add "v8" d8 $ESHOST_PATH_V8;
eshost --add "xs" xs $ESHOST_PATH_XS;
