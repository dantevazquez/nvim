#!/usr/bin/env bash

set -euo pipefail

BASE_RAW_URL="https://raw.githubusercontent.com/neovim/nvim-lspconfig/master/lsp"
BASE_API_URL="https://api.github.com/repos/neovim/nvim-lspconfig/contents/lsp"

update_file() {
    local file="$1"
    local url="$BASE_RAW_URL/$file"

    echo "Installing/updating $file..."

    if curl -fsSL "$url" -o "$file.tmp"; then
        mv "$file.tmp" "$file"
        echo "  ✔ $file installed"
    else
        rm -f "$file.tmp"
        echo "  ✖ $file not found in repo"
        return 1
    fi
}

list_files() {
    curl -fsSL "$BASE_API_URL" \
        | grep '"name":' \
        | cut -d '"' -f4 \
        | grep '\.lua$' \
        | sort
}

fzf_pick() {
    command -v fzf >/dev/null 2>&1 || {
        echo "fzf is not installed"
        exit 1
    }

    file=$(list_files | fzf --prompt="Select LSP config > ")

    [[ -z "$file" ]] && exit 0

    update_file "$file"
}

# ---- Main logic ----

case "${1:-}" in
    --list)
        list_files
        ;;
    --fzf)
        fzf_pick
        ;;
    *)
        if [[ $# -ge 1 ]]; then
            for arg in "$@"; do
                file="$arg"
                [[ "$file" != *.lua ]] && file="$file.lua"
                update_file "$file" || true
            done
        else
            shopt -s nullglob
            for file in *.lua; do
                update_file "$file" || true
            done
        fi
        ;;
esac
