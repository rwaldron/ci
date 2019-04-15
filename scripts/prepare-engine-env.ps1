set ESHOST_PATH=%CD%
mkdir hosts
# Engine262: Clone, Build, Link and set PATH
mkdir engine262
git clone https://github.com/devsnek/engine262.git engine262
cd %CD%\engine262
npm install
npm run build
npm link
set ESHOST_ENGINE262_PATH=C:\Users\appveyor\AppData\Roaming\npm\
set PATH=%PATH%;C:\Users\appveyor\AppData\Roaming\npm\
where engine262
cd %ESHOST_PATH%
npm install --ignore-scripts
# - npm link
.\node_modules\.bin\jsvu --os=win64 --engines="chakra,spidermonkey,v8,xs"

dir C:\Users\appveyor\AppData\Roaming\npm\
dir %USERPROFILE%\.jsvu\

set PATH=%PATH%;%USERPROFILE%\.jsvu\
set ESHOST_PATH_CHAKRA=%USERPROFILE%\.jsvu\chakra.cmd
set ESHOST_PATH_ENGINE262=C:\Users\appveyor\AppData\Roaming\npm\engine262.cmd
set ESHOST_PATH_SPIDERMONKEY=%USERPROFILE%\.jsvu\spidermonkey.cmd
set ESHOST_PATH_V8=%USERPROFILE%\.jsvu\v8.cmd
set ESHOST_PATH_XS=%USERPROFILE%\.jsvu\xs.cmd

.\node_modules\.bin\eshost --add "chakra" ch %ESHOST_PATH_CHAKRA%
.\node_modules\.bin\eshost --add "engine262" engine262 %ESHOST_PATH_ENGINE262%
.\node_modules\.bin\eshost --add "spidermonkey" jsshell %ESHOST_PATH_SPIDERMONKEY%
.\node_modules\.bin\eshost --add "v8" d8 %ESHOST_PATH_V8%
.\node_modules\.bin\eshost --add "xs" xs %ESHOST_PATH_XS%
