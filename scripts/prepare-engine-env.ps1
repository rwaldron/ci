$Env:CI_BUILD_DIR = Get-Location
git clone https://github.com/devsnek/engine262.git
cd $Env:CI_BUILD_DIR\engine262
npm install
npm run build
npm link

cd $Env:CI_BUILD_DIR

npm install -g jsvu eshost-cli

jsvu --os=win64 --engines="chakra,spidermonkey,v8,xs"

$Env:PATH="$Env:PATH;$Env:USERPROFILE\.jsvu\"
$Env:ESHOST_PATH_CHAKRA="$Env:USERPROFILE\.jsvu\chakra.cmd"
$Env:ESHOST_PATH_ENGINE262=(get-command engine262).Path
$Env:ESHOST_PATH_NODE=(get-command node).Path
$Env:ESHOST_PATH_SPIDERMONKEY="$Env:USERPROFILE\.jsvu\spidermonkey.cmd"
$Env:ESHOST_PATH_V8="$Env:USERPROFILE\.jsvu\v8.cmd"
$Env:ESHOST_PATH_XS="$Env:USERPROFILE\.jsvu\xs.cmd"

eshost --add "chakra" ch $Env:ESHOST_PATH_CHAKRA
eshost --add "engine262" engine262 $Env:ESHOST_PATH_ENGINE262
eshost --add "node" node $Env:ESHOST_PATH_NODE
eshost --add "spidermonkey" jsshell $Env:ESHOST_PATH_SPIDERMONKEY
eshost --add "v8" d8 $Env:ESHOST_PATH_V8
eshost --add "xs" xs $Env:ESHOST_PATH_XS
