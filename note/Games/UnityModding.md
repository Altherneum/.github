# Introduction
BeepInEx with ILCPP
## Lib
- [github.com/BepInEx/BepInEx](https://github.com/BepInEx/BepInEx)
  - [docs.bepinex.dev/articles/user_guide/installation](https://docs.bepinex.dev/articles/user_guide/installation/index.html)
  - [docs.bepinex.dev/master/articles/user_guide/installation](https://docs.bepinex.dev/master/articles/user_guide/installation/index.html)
  - [docs.bepinex.dev/master/articles/user_guide/installation/unity_il2cpp](https://docs.bepinex.dev/master/articles/user_guide/installation/unity_il2cpp.html)
  - [docs.bepinex.dev/master/articles/dev_guide/plugin_tutorial](https://docs.bepinex.dev/master/articles/dev_guide/plugin_tutorial/index.html)

## Based on
- Shop Empire
- [github.com/JoakimCarlsson/ShopTitansTrainer](https://github.com/JoakimCarlsson/ShopTitansTrainer)

# How to create
## Setting up
- [docs.bepinex.dev/master/articles/dev_guide/plugin_tutorial/1_setup](https://docs.bepinex.dev/master/articles/dev_guide/plugin_tutorial/1_setup.html)

`BepInEx\config\BepInEx.cfg`
```
Enabled = true
```

`scripts\install.bat`
```
$path 
## Set relative path to where we are when exec script #
## Set path for download in following line #
bitsadmin /transfer downloadBepInExILCPP /download /priority FOREGROUND "https://builds.bepinex.dev/projects/bepinex_be/725/BepInEx-Unity.IL2CPP-win-x64-6.0.0-be.725%2Be1974e2.zip" "C:\Users\User\Downloads\file.zip"
```