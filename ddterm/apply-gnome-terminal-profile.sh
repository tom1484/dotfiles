#!/usr/bin/env bash
set -euo pipefail

# Apply a GNOME Terminal (Gogh) profile into ddterm Custom palette/colors.
#
# Usage:
#   ddterm-apply-gogh-profile.sh "Kanagawa Wave"
#   ddterm-apply-gogh-profile.sh --list
#
# Notes:
# - ddterm is installed as a GNOME Shell extension, so its gsettings schema
#   usually lives inside the extension directory and must be accessed via --schemadir.
# - This script only sets keys that exist on your ddterm version.

DDTERM_EXT_DIR="$HOME/.local/share/gnome-shell/extensions/ddterm@amezin.github.com"
DDTERM_SCHEMADIR="$DDTERM_EXT_DIR/schemas"
DDTERM_SCHEMA="com.github.amezin.ddterm"

die() { echo "ERROR: $*" >&2; exit 1; }

need() {
  command -v "$1" >/dev/null 2>&1 || die "missing dependency: $1"
}

need gsettings
need sed
need tr

if [[ ! -d "$DDTERM_EXT_DIR" ]]; then
  die "ddterm extension not found at: $DDTERM_EXT_DIR"
fi

if [[ ! -d "$DDTERM_SCHEMADIR" ]]; then
  die "ddterm schema dir not found at: $DDTERM_SCHEMADIR"
fi

# Compile schemas if missing (common for extension-local installs)
if [[ ! -f "$DDTERM_SCHEMADIR/gschemas.compiled" ]]; then
  need glib-compile-schemas
  glib-compile-schemas "$DDTERM_SCHEMADIR"
fi

# Load ddterm keys for existence checks
DDTERM_KEYS="$(gsettings --schemadir "$DDTERM_SCHEMADIR" list-keys "$DDTERM_SCHEMA" 2>/dev/null || true)"
[[ -n "$DDTERM_KEYS" ]] || die "Cannot read ddterm schema keys. Is ddterm enabled?"

has_key() {
  grep -qx "$1" <<<"$DDTERM_KEYS"
}

set_if_exists() {
  local key="$1"
  local value="$2"
  if has_key "$key"; then
    gsettings --schemadir "$DDTERM_SCHEMADIR" set "$DDTERM_SCHEMA" "$key" "$value"
    echo "Set ddterm: $key"
    return 0
  fi
  return 1
}

list_profiles() {
  local uuids base name
  uuids="$(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]'," || true)"
  if [[ -z "$uuids" ]]; then
    echo "(no GNOME Terminal profiles found)"
    return 0
  fi
  for u in $uuids; do
    base="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$u/"
    name="$(gsettings get "$base" visible-name 2>/dev/null || echo "''")"
    echo "$u -> $name"
  done
}

if [[ "${1:-}" == "--list" ]]; then
  list_profiles
  exit 0
fi

PROFILE_NAME="${1:-}"
[[ -n "$PROFILE_NAME" ]] || die "Usage: $0 \"Profile Name\"  (or $0 --list)"

# Find GNOME Terminal profile UUID by visible-name
UUIDS="$(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]'," || true)"
[[ -n "$UUIDS" ]] || die "No GNOME Terminal profiles found."

TARGET_UUID=""
for u in $UUIDS; do
  GNOME_BASE="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$u/"
  name="$(gsettings get "$GNOME_BASE" visible-name 2>/dev/null | sed "s/^'//; s/'$//")"
  if [[ "$name" == "$PROFILE_NAME" ]]; then
    TARGET_UUID="$u"
    break
  fi
done

if [[ -z "$TARGET_UUID" ]]; then
  echo "Profile not found: '$PROFILE_NAME'"
  echo
  echo "Available GNOME Terminal profiles:"
  list_profiles
  exit 1
fi

GNOME_BASE="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$TARGET_UUID/"

PALETTE="$(gsettings get "$GNOME_BASE" palette)"
BG="$(gsettings get "$GNOME_BASE" background-color)"
FG="$(gsettings get "$GNOME_BASE" foreground-color)"
BOLD="$(gsettings get "$GNOME_BASE" bold-color)"
CURSOR_FG="$(gsettings get "$GNOME_BASE" cursor-foreground-color)"
CURSOR_BG="$(gsettings get "$GNOME_BASE" cursor-background-color)"
CURSOR_SET="$(gsettings get "$GNOME_BASE" cursor-colors-set)"
HIGHLIGHT_FG="$(gsettings get "$GNOME_BASE" highlight-foreground-color)"
HIGHLIGHT_BG="$(gsettings get "$GNOME_BASE" highlight-background-color)"
HIGHLIGHT_SET="$(gsettings get "$GNOME_BASE" highlight-colors-set)"

echo "GNOME Terminal profile: '$PROFILE_NAME' ($TARGET_UUID)"
echo "  background = $BG"
echo "  foreground = $FG"
echo "  bold       = $BOLD"
echo "  cursor-foreground = $CURSOR_FG"
echo "  cursor-background = $CURSOR_BG"
echo "  cursor-colors-set = $CURSOR_SET"
echo "  highlight-foreground = $HIGHLIGHT_FG"
echo "  highlight-background = $HIGHLIGHT_BG"
echo "  highlight-colors-set = $HIGHLIGHT_SET"
echo "  palette    = (16 colors)"

# ---- Apply colors into ddterm custom fields ----
# These key names are the most common ones in ddterm versions.
# If your build uses different names, we set only those that exist.
set_if_exists "use-theme-colors" "false"
set_if_exists "background-color" "$BG"
set_if_exists "foreground-color" "$FG"
set_if_exists "bold-color" "$BOLD"
set_if_exists "cursor-foreground-color" "$CURSOR_FG"
set_if_exists "cursor-background-color" "$CURSOR_BG"
set_if_exists "cursor-colors-set" "$CURSOR_SET"
set_if_exists "highlight-foreground-color" "$HIGHLIGHT_FG"
set_if_exists "highlight-background-color" "$HIGHLIGHT_BG"
set_if_exists "highlight-colors-set" "$HIGHLIGHT_SET"
set_if_exists "palette" "$PALETTE"

# ---- Force ddterm to actually USE the custom palette (best-effort) ----
# Different ddterm versions expose different "mode" keys. We try the common ones:
# (If none exist, you may need to manually set Palette to Custom in ddterm UI once.)
set_if_exists "use-theme-colors" "false"

echo
echo "Done."
echo "If ddterm doesn't update immediately: toggle ddterm off/on or open a new ddterm tab."

# Optional: toggle ddterm (uncomment if you want auto-refresh)
# gdbus call --session \
#   --dest org.gnome.Shell \
#   --object-path /org/gnome/Shell/Extensions/ddterm \
#   --method com.github.amezin.ddterm.Extension.Toggle >/dev/null || tr
