#!/bin/bash

sudo apt-get install -y \
    software-properties-common \
    apt-transport-https

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt-get update
sudo apt-get install -y code

code --install-extension ms-vscode.cpptools
code --install-extension ms-python.python
code --install-extension eamodio.gitlens
code --install-extension PKief.material-icon-theme
code --install-extension Equinusocio.vsc-material-theme
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension vincaslt.highlight-matching-tag
code --install-extension aaron-bond.better-comments
code --install-extension ms-vscode.cmake-tools
code --install-extension hediet.vscode-drawio
code --install-extension yzhang.markdown-all-in-one
code --install-extension ms-vscode.cpptools-extension-pack

echo "{
    \"security.workspace.trust.enabled\": false,
    \"workbench.iconTheme\": \"material-icon-theme\",
    \"workbench.colorTheme\": \"Community Material Theme Darker High Contrast\",
    \"files.autoSave\": \"afterDelay\",
    \"editor.minimap.enabled\": false,
    \"workbench.activityBar.visible\": false,
    \"workbench.statusBar.visible\": false,
    \"window.menuBarVisibility\": \"toggle\",
    \"editor.multiCursorModifier\": \"ctrlCmd\"
}" >  ~/.config/Code/User/settings.json

echo "// Place your key bindings in this file to override the defaultsauto[]
[
    {
        \"key\": \"ctrl+shift+x\",
        \"command\": \"workbench.action.toggleMaximizedPanel\"
    },
    {
        \"key\": \"ctrl+shift+q\",
        \"command\": \"workbench.action.toggleActivityBarVisibility\"
    }
]
" > ~/.config/Code/User/keybindings.json

# emoji error with gtk3.0 in ubuntu18.04
echo 'alias code="GTK_IM_MODULE=xim code"' >> /home/${USER}/.bashrc
