#!/bin/sh
echo -ne '\033c\033]0;war of Ipmuls\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/war of impuls.x86_64" "$@"
