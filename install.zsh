project_dir=`dirname $0` 
src_dir=src

pushd $project_dir 2>&1 > /dev/null

if [ -d $src_dir ]; then
    pushd $src_dir 2>&1 > /dev/null
else
    echo "No dotfiles were found during installation!"
    popd 2>&1 > /dev/null
    exit 1
fi

for dotfile in `ls`; do
    full_path="$(cd "$(dirname "$dotfile")" && pwd)/$(basename "$dotfile")"
    ln -i -s $full_path $HOME/.$dotfile
done

popd 2>&1 > /dev/null
popd 2>&1 > /dev/null
