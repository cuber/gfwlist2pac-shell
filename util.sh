#! /bin/sh

function format { 
  local data
  while read data; do echo "  '$data': 1,"; done
}

function urlencode {
  local length="${#1}"
  for (( i = 0; i < length; i++ )); do
    local c="${1:i:1}"
    case $c in
      [a-zA-Z0-9.~_-]) printf "$c" ;;
      *) printf '%%%02X' "'$c"
    esac
  done
}

function urldecode {
  local data
  while read data; do
    local url_encoded="${data//+/ }"
    echo $(printf '%b' "${url_encoded//%/\x}")
  done
}
