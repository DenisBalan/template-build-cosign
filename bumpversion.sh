#!/usr/bin/env bash

function log_info() {
  >&2 echo -e "[\\e[1;94mINFO\\e[0m] $*"
}

function log_warn() {
  >&2 echo -e "[\\e[1;93mWARN\\e[0m] $*"
}

function log_error() {
  >&2 echo -e "[\\e[1;91mERROR\\e[0m] $*"
}

# check number of arguments
if [[ "$#" -le 2 ]]; then
  log_error "Missing arguments"
  log_error "Usage: $0 <current version> <next version>"
  exit 1
fi

curVer=$1
nextVer=$2
relType=$3

if [[ "$curVer" ]]; then
  log_info "Bump version from \\e[33;1m${curVer}\\e[0m to \\e[33;1m${nextVer}\\e[0m (release type: $relType)..."

  # replace in README
  sed -e "s/ref: *'$curVer'/ref: '$nextVer'/" -e "s/ref: *\"$curVer\”/ref: \”$nextVer\”/" -e "s/component: *\(.*\)@$curVer/component: \1@$nextVer/" README.md > README.md.next
  mv -f README.md.next README.md

  # replace in template and variants
  for tmpl in templates/*.yml
  do
    sed -e "s/command: *\[ *\"--service\", *\"\(.*\)\", *\"$curVer\" *\]/command: [\"--service\", \"\1\", \"$nextVer\"]/" "$tmpl" > "$tmpl.next"
    mv -f "$tmpl.next" "$tmpl"
  done
else
  log_info "Bump version to \\e[33;1m${nextVer}\\e[0m (release type: $relType): this is the first release (skip)..."
fi
