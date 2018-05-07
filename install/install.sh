SCRIPT_DIR=$(dirname "$0")

files=(
dependencies.sh
vscode-plugins.sh
)

for file in "${files[@]}"
do
    ./$SCRIPT_DIR/$file
done
