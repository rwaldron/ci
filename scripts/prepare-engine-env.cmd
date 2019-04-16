set ESHOST_PATH = Get-Location
mkdir hosts
# Engine262: Clone, Build, Link and set PATH
mkdir engine262
git clone https://github.com/devsnek/engine262.git engine262
cd %ESHOST_PATH%\engine262
npm install
npm run build
npm link

where engine262
set ESHOST_ENGINE262_PATH = (where engine262) | Out-String

cd %ESHOST_PATH%
# npm install --ignore-scripts
# - npm link

npm install -g jsvu eshost-cli

jsvu --os=win64 --engines="chakra,spidermonkey,v8,xs"


set PATH="%PATH%;%USERPROFILE%\.jsvu\"
set ESHOST_PATH_CHAKRA="%USERPROFILE%\.jsvu\chakra.cmd"
set ESHOST_PATH_ENGINE262="%ESHOST_ENGINE262_PATH%"
set ESHOST_PATH_SPIDERMONKEY="%USERPROFILE%\.jsvu\spidermonkey.cmd"
set ESHOST_PATH_V8="%USERPROFILE%\.jsvu\v8.cmd"
set ESHOST_PATH_XS="%USERPROFILE%\.jsvu\xs.cmd"

eshost --add "chakra" ch %ESHOST_PATH_CHAKRA%
eshost --add "engine262" engine262 %ESHOST_PATH_ENGINE262%
eshost --add "spidermonkey" jsshell %ESHOST_PATH_SPIDERMONKEY%
eshost --add "v8" d8 %ESHOST_PATH_V8%
eshost --add "xs" xs %ESHOST_PATH_XS%

eshost --list
