export E_ALIAS_DIR="$E_BASH_DIR"/aliases.d
for aliasfile in "$E_ALIAS_DIR"/*
do
    . "$aliasfile"
done