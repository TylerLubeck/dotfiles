function check_for_virtual_env {
  [ -d .git ] || git rev-parse --git-dir &> /dev/null

  if [ $? == 0 ]; then
    local ENV_NAME=`basename \`pwd\``

    if [ "${VIRTUAL_ENV##*/}" != $ENV_NAME ] && [ -e $WORKON_HOME/$ENV_NAME/bin/activate ]; then
      workon $ENV_NAME && export CD_VIRTUAL_ENV=$ENV_NAME
    fi
  elif [ $CD_VIRTUAL_ENV ]; then
    deactivate && unset CD_VIRTUAL_ENV
  fi
}

function cd {
  builtin cd "$@" && check_for_virtual_env
}

check_for_virtual_env
