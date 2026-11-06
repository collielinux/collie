# A language the install media preset (/etc/collie/language) becomes this
# user's desktop language; the system step generated its locale.
code=
[[ -r /etc/collie/language ]] && read -r code </etc/collie/language
if [[ -n $code ]]; then
  "$COLLIE_PATH/bin/collie-language" seed "$code" || echo "Could not set the preset language $code" >&2
fi
