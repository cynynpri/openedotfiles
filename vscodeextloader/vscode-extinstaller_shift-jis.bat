@echo off

REM file encoding=shift-jis
REM for your information.
REM url : https://qiita.com/rai_suta/items/5ebdffc56e7e7768528b

REM 遅延環境変数(!cnt!)の有効化.
setlocal ENABLEDELAYEDEXPANSION

REM 添え字を付けて変数を定義.
set ext_1=akamud.vscode-theme-onelight
set ext_2=Angular.ng-template
set ext_3=arcticicestudio.nord-visual-studio-code
set ext_4=austin.code-gnu-global
set ext_5=castwide.solargraph
set ext_6=cocopon.iceberg-theme
set ext_7=dbaeumer.vscode-eslint
set ext_8=DotJoshJohnson.xml
set ext_9=dracula-theme.theme-dracula
set ext_10=EliverLara.andromeda
set ext_11=harg.iceberg
set ext_12=henoc.svgeditor
set ext_13=jolaleye.horizon-theme-vscode
set ext_14=justusadam.language-haskell
set ext_15=kisstkondoros.vscode-gutter-preview
set ext_16=kuscamara.electron
set ext_17=Leopotam.csharpfixformat
set ext_18=liviuschera.noctis
set ext_19=mathiasfrohlich.Kotlin
set ext_20=Mikael.Angular-BeastCode
set ext_21=mine.cpplint
set ext_22=ms-azuretools.vscode-docker
set ext_23=MS-CEINTL.vscode-language-pack-ja
set ext_24=ms-kubernetes-tools.vscode-kubernetes-tools
set ext_25=ms-python.python
set ext_26=ms-vscode.atom-keybindings
set ext_27=ms-vscode.cpptools
set ext_28=ms-vscode.csharp
set ext_29=ms-vscode.Go
set ext_30=ms-vscode.Theme-1337
set ext_31=ms-vscode.Theme-TomorrowKit
set ext_32=ms-vsts.team
set ext_33=naumovs.color-highlight
set ext_34=octref.vetur
set ext_35=raashida.fixthecode-vs
set ext_36=rafaelmaiolla.remote-vscode
set ext_37=rebornix.ruby
set ext_38=redhat.java
set ext_39=redhat.vscode-yaml
set ext_40=rokoroku.vscode-theme-darcula
set ext_41=sallar.vscode-duotone-dark
set ext_42=Tyriar.theme-sapphire
set ext_43=VisualStudioExptTeam.vscodeintellicode
set ext_44=vscjava.vscode-java-debug
set ext_45=vscjava.vscode-java-dependency
set ext_46=vscjava.vscode-java-pack
set ext_47=vscjava.vscode-java-test
set ext_48=vscjava.vscode-maven
set ext_49=vscode-icons-team.vscode-icons
set ext_50=vscoss.vscode-ansible
set ext_51=wesbos.theme-cobalt2
set ext_52=xabikos.JavaScriptSnippets
set ext_53=zhuangtongfa.Material-theme

set cnt=1
:BEGIN
call set it=%%ext_!cnt!%%
if defined it (
    echo install_ext=!it!
    echo code --install-extension !it!
    REM 実行するときは下記のREMを外してコメントアウトを外す.
    REM code --install-extension !it!
    set /A cnt+=1
    goto:BEGIN
)
