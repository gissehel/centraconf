#!/usr/bin/env bash

bootstrap_header_size=800
targetdir="$1"
[ -z "$targetdir" ] && targetdir="$(dirname "$0")/.."
wd="$(pwd)"
cd "$targetdir"
targetdir="$(pwd)"
which git >/dev/null && git submodule init
which git >/dev/null && git submodule update -f
cd "$wd"
echo "Create a bootstrap from [$targetdir] (enter=>yes)?"
read yesno
[ \! -z "$yesno" ] && echo "aborting..." && exit 0
bootstrap_filename="$targetdir"/../"$(basename "$targetdir")".bootstrap

function fail_message() {
    echo "[ERROR] $1 ... aborting..."
    exit 1
}
function get_bootstrap_header() {
    dd if="$targetdir"/__tools__/bootstrap_header bs=${bootstrap_header_size} skip=0 count=1 status=none
}

get_bootstrap_header | grep "FILL FILL" > /dev/null || fail_message "Wrong bootstrap header size"
HEADER_SIZE_MATCH=$(get_bootstrap_header | grep "bootstrap_header_size=")
[ "${HEADER_SIZE_MATCH#*=}" != "${bootstrap_header_size}" ] && fail_message "'bootstrap_header_size' don't match"

rm -f "${bootstrap_filename}"
(get_bootstrap_header ; cd "$targetdir" ; tar cz .) > "${bootstrap_filename}"
[ -f "${bootstrap_filename}" ] && echo "done" || fail_message "Something went wrong"

