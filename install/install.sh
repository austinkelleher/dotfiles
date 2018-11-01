SCRIPT_DIR=$(dirname "$0")

files=(
dependencies.sh
configure-zsh.sh
vscode-plugins.sh
configure-git.sh
)

for file in "${files[@]}"
do
    ./$SCRIPT_DIR/$file
done
