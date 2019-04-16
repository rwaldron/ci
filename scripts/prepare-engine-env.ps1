$Env:ESHOST_PATH = Get-Location
mkdir hosts
# Engine262: Clone, Build, Link and set PATH
mkdir engine262
git clone https://github.com/devsnek/engine262.git engine262
cd $Env:ESHOST_PATH\engine262
npm install
npm run build
npm link
# $Env:ESHOST_ENGINE262_PATH="C:\Users\appveyor\AppData\Roaming\npm\"
# $Env:PATH="$Env:PATH;C:\Users\appveyor\AppData\Roaming\npm\"
where engine262

$Env:ESHOST_ENGINE262_PATH = (where engine262) | Out-String
$Env:ESHOST_NODE_PATH = (where node) | Out-String

cd $Env:ESHOST_PATH
# npm install --ignore-scripts
# - npm link

npm install -g jsvu eshost-cli

jsvu --os=win64 --engines="chakra,spidermonkey,v8,xs"

dir C:\Users\appveyor\AppData\Roaming\npm\
dir $Env:USERPROFILE\.jsvu\

$Env:PATH="$Env:PATH;$Env:USERPROFILE\.jsvu\"
$Env:ESHOST_PATH_CHAKRA="$Env:USERPROFILE\.jsvu\chakra.cmd"
$Env:ESHOST_PATH_ENGINE262="$Env:ESHOST_ENGINE262_PATH"
$Env:ESHOST_PATH_NODE="$Env:ESHOST_NODE_PATH"
$Env:ESHOST_PATH_SPIDERMONKEY="$Env:USERPROFILE\.jsvu\spidermonkey.cmd"
$Env:ESHOST_PATH_V8="$Env:USERPROFILE\.jsvu\v8.cmd"
$Env:ESHOST_PATH_XS="$Env:USERPROFILE\.jsvu\xs.cmd"

eshost --add "chakra" ch $Env:ESHOST_PATH_CHAKRA
eshost --add "engine262" engine262 $Env:ESHOST_PATH_ENGINE262
eshost --add "node" node $Env:ESHOST_NODE_PATH
eshost --add "spidermonkey" jsshell $Env:ESHOST_PATH_SPIDERMONKEY
eshost --add "v8" d8 $Env:ESHOST_PATH_V8
eshost --add "xs" xs $Env:ESHOST_PATH_XS

eshost --list
