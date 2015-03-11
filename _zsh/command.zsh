## autorehash on rbenv
function reload(){
    exec $SHELL -l
}

## gitignore
function gitignore(){
    curl -s https://www.gitignore.io/api/$* >> .gitignore
}

## auto-rehash on rbenv
function gem(){
    $HOME/.rbenv/shims/gem $*
    if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
    then
        rbenv rehash
        rehash
    fi
}
