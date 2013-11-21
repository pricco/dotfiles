#!/usr/bin/env bash
# Monokai - Gnome Terminal color scheme install script
#wget https://github.com/todylu/monaco.ttf/raw/master/monaco.ttf

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Monokai"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="Monokai"
[[ -z "$GCONFTOOL" ]] && GCONFTOOL=gconftool-2
[[ -z "$BASE_KEY" ]] && BASE_KEY=/apps/gnome-terminal/profiles

PROFILE_KEY="$BASE_KEY/$PROFILE_SLUG"

gset() {
  local type="$1"; shift
  local key="$1"; shift
  local val="$1"; shift

  "$GCONFTOOL" --set --type "$type" "$PROFILE_KEY/$key" -- "$val"
}

# Because gconftool doesn't have "append"
glist_append() {
  local type="$1"; shift
  local key="$1"; shift
  local val="$1"; shift

  local entries="$(
    {
      "$GCONFTOOL" --get "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
      echo "$val"
    } | head -c-1 | tr "\n" ,
  )"

  "$GCONFTOOL" --set --type list --list-type $type "$key" "[$entries]"
}

# Append the Monokai-Kepbod profile to the profile list
glist_append string /apps/gnome-terminal/global/profile_list "$PROFILE_SLUG"

gset string visible_name "$PROFILE_NAME"

gset string palette        "#1B1B1D1D1E1E:#F9F926267272:#8282B4B41414:#FDFD97971F1F:#5656C2C2D6D6:#8C8C5454FEFE:#464654545757:#CCCCCCCCC6C6:#505053535454:#FFFF59599595:#B6B6E3E35454:#FEFEEDED6C6C:#8C8CEDEDFFFF:#9E9E6F6FFEFE:#89899C9CA1A1:#F8F8F8F8F2F2"
gset string background_color "#262626262626"
gset string foreground_color "#FFFFFFFFFFFF"
gset string bold_color "#000000000000"
gset bool   bold_color_same_as_fg "true"
gset bool   use_theme_colors "false"
gset bool   use_theme_background "false"

