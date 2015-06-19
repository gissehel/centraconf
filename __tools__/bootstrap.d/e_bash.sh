centraconf_dir="$1"
local_e_bash_dir="${centraconf_dir}"/apps/e_bash
local_profile="${local_e_bash_dir}/profile"
local_rc="${local_e_bash_dir}/rc"

echo 'export E_BASH_DIR='"$local_e_bash_dir" > "${local_profile}"
echo 'if [ -f "$E_BASH_DIR"/envvars.sh ]; then . "$E_BASH_DIR"/envvars.sh; fi' >> "${local_profile}"

echo 'export E_BASH_DIR='"$local_e_bash_dir" > "${local_rc}"
echo 'if [ -f "$E_BASH_DIR"/functions.sh ]; then . "$E_BASH_DIR"/functions.sh; fi' >> "${local_rc}"
echo 'if [ -f "$E_BASH_DIR"/aliases.sh ]; then . "$E_BASH_DIR"/aliases.sh; fi' >> "${local_rc}"
echo 'if [ -z "$E_ENVVAR_DIR" ]; then' >> "${local_rc}"
echo '    if [ -f "$E_BASH_DIR"/envvars.sh ]; then . "$E_BASH_DIR"/envvars.sh; fi' >> "${local_rc}"
echo 'fi' >> "${local_rc}"

echo 'export CENTRACONF_DIR="'"${centraconf_dir}"'"' > "${local_e_bash_dir}/envvars.d/CENTRACONF_DIR"

echo ". \"${local_e_bash_dir}/rc\""
