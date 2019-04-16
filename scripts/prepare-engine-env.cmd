set ESHOST_PATH = %CD%

if exist "%CD%\engine262" (
  echo "%CD%\engine262 exists"
) else (
  git clone https://github.com/devsnek/engine262.git
  cd %ESHOST_PATH%\engine262
  npm install
  npm run build
  npm link
)

rem mkdir hosts
rem mkdir engine262
rem git clone https://github.com/devsnek/engine262.git engine262
rem cd %ESHOST_PATH%\engine262
rem npm install
rem npm run build
rem npm link

where engine262
set ESHOST_ENGINE262_PATH = (where engine262)
set ESHOST_NODE_PATH = (where node)

cd %ESHOST_PATH%

npm install -g jsvu eshost-cli

jsvu --os=win64 --engines="chakra,spidermonkey,v8,xs"

echo %ESHOST_ENGINE262_PATH%
echo %ESHOST_NODE_PATH%

set PATH="%PATH%;%USERPROFILE%\.jsvu\"
set ESHOST_PATH_CHAKRA="%USERPROFILE%\.jsvu\chakra.cmd"
set ESHOST_PATH_ENGINE262="%ESHOST_ENGINE262_PATH%"
set ESHOST_PATH_NODE="%ESHOST_NODE_PATH%"
set ESHOST_PATH_SPIDERMONKEY="%USERPROFILE%\.jsvu\spidermonkey.cmd"
set ESHOST_PATH_V8="%USERPROFILE%\.jsvu\v8.cmd"
set ESHOST_PATH_XS="%USERPROFILE%\.jsvu\xs.cmd"

eshost --add "chakra" ch %ESHOST_PATH_CHAKRA%
eshost --add "engine262" engine262 %ESHOST_PATH_ENGINE262%
eshost --add "node" node %ESHOST_PATH_NODE%
eshost --add "spidermonkey" jsshell %ESHOST_PATH_SPIDERMONKEY%
eshost --add "v8" d8 %ESHOST_PATH_V8%
eshost --add "xs" xs %ESHOST_PATH_XS%

eshost --list
