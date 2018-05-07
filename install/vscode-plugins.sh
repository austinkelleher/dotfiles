extensions=(
dbaeumer.vscode-eslint
eg2.tslint
kumar-harsh.graphql-for-vscode
lukehoban.Go
mauve.terraform
pcanella.marko
vscodevim.vim
)

for extension in "${extensions[@]}"
do
    code --install-extension "$extension"
done

# TODO: Fix this
ln -sfv "../vscode/settings.json" ~/Library/Application\ Support/Code/User
ln -sfv "../vscode/keybindings.json" ~/Library/Application\ Support/Code/User

# Fix key repeat in vscode
# https://stackoverflow.com/questions/39972335/how-do-i-press-and-hold-a-key-and-have-it-repeat-in-vscode/44010683#44010683
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
