set CI_BUILD_DIR=%CD%

git clone https://github.com/devsnek/engine262.git
cd %CI_BUILD_DIR%\engine262
npm install
npm run build
npm link

where engine262

cd %CI_BUILD_DIR%

npm install -g jsvu eshost-cli

jsvu --os=win64 --engines="chakra,spidermonkey,v8,xs"

rem where engine262 > where-engine262.txt
rem set /p ESHOST_ENGINE262_PATH<=where-engine262.txt

rem where node > where-node.txt
rem set /p ESHOST_NODE_PATH<=where-node.txt



rem set ESHOST_ENGINE262_PATH = (where engine262)
rem set ESHOST_NODE_PATH = (where node)


rem set PATH="%PATH%;%USERPROFILE%\.jsvu\"
rem set ESHOST_PATH_CHAKRA="%USERPROFILE%\.jsvu\chakra.cmd"
rem set ESHOST_PATH_ENGINE262="%ESHOST_ENGINE262_PATH%"
rem set ESHOST_PATH_NODE="%ESHOST_NODE_PATH%"
rem set ESHOST_PATH_SPIDERMONKEY="%USERPROFILE%\.jsvu\spidermonkey.cmd"
rem set ESHOST_PATH_V8="%USERPROFILE%\.jsvu\v8.cmd"
rem set ESHOST_PATH_XS="%USERPROFILE%\.jsvu\xs.cmd"

rem eshost --add "chakra" ch %ESHOST_PATH_CHAKRA%
rem eshost --add "engine262" engine262 %ESHOST_PATH_ENGINE262%
rem eshost --add "node" node %ESHOST_PATH_NODE%
rem eshost --add "spidermonkey" jsshell %ESHOST_PATH_SPIDERMONKEY%
rem eshost --add "v8" d8 %ESHOST_PATH_V8%
rem eshost --add "xs" xs %ESHOST_PATH_XS%

rem eshost --list
