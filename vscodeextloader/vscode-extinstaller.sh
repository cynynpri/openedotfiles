#!/bin/bash

# for your information
# url : https://qiita.com/takeru08ma/items/43705af9fa864cf3bc18

# ext Package list
extlist=(
akamud.vscode-theme-onelight
Angular.ng-template
arcticicestudio.nord-visual-studio-code
austin.code-gnu-global
castwide.solargraph
cocopon.iceberg-theme
dbaeumer.vscode-eslint
DotJoshJohnson.xml
dracula-theme.theme-dracula
EliverLara.andromeda
harg.iceberg
henoc.svgeditor
jolaleye.horizon-theme-vscode
justusadam.language-haskell
kisstkondoros.vscode-gutter-preview
kuscamara.electron
Leopotam.csharpfixformat
liviuschera.noctis
mathiasfrohlich.Kotlin
Mikael.Angular-BeastCode
mine.cpplint
ms-azuretools.vscode-docker
MS-CEINTL.vscode-language-pack-ja
ms-kubernetes-tools.vscode-kubernetes-tools
ms-python.python
ms-vscode.atom-keybindings
ms-vscode.cpptools
ms-vscode.csharp
ms-vscode.Go
ms-vscode.Theme-1337
ms-vscode.Theme-TomorrowKit
ms-vsts.team
naumovs.color-highlight
octref.vetur
raashida.fixthecode-vs
rafaelmaiolla.remote-vscode
rebornix.ruby
redhat.java
redhat.vscode-yaml
rokoroku.vscode-theme-darcula
sallar.vscode-duotone-dark
Tyriar.theme-sapphire
VisualStudioExptTeam.vscodeintellicode
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-maven
vscode-icons-team.vscode-icons
vscoss.vscode-ansible
wesbos.theme-cobalt2
xabikos.JavaScriptSnippets
zhuangtongfa.Material-theme
)

for ext_package in ${extlist[@]}; do
  echo "code --install-extention $ext_package"
  code --install-extention $ext_package
done
echo "ext-packages install successful."
