#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/godot"
scratch=$(mktemp -d)
trap 'rm -r -- "$scratch"' EXIT

install_addon() {
    local name=$1 repository=$2 tag=$3 revision=$4
    git -c advice.detachedHead=false clone --quiet --depth 1 --branch "$tag" -- "$repository" "$scratch/$name"
    local actual
    actual=$(git -C "$scratch/$name" rev-parse HEAD)
    if [[ "$actual" != "$revision" ]]; then
        printf 'Unexpected revision for %s: %s\n' "$name" "$actual" >&2
        return 1
    fi
    mkdir -p addons
    cp -a "$scratch/$name/addons/$name" addons/
}

install_addon dialogue_manager https://github.com/nathanhoad/godot_dialogue_manager.git v4.1.0 a719088aea342572f29b5559fd8726896c9519b2
install_addon inventory-system https://github.com/expressobits/inventory-system.git addon-2.13.0 5d9a6f430cdee01f39c4c37d0c78a24c181411c0
