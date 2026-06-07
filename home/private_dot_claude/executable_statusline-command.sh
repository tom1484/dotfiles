#!/bin/sh
# Claude Code statusLine command — mirrors Starship prompt style

input=$(cat)

# Directory (current working dir, abbreviated like Starship)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
if [ -n "$cwd" ]; then
  short_dir=$(echo "$cwd" | sed "s|^$HOME|~|")
else
  short_dir=$(pwd | sed "s|^$HOME|~|")
fi

# Git branch (skip optional locks)
branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null)

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // empty')

# Context remaining
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Build output
printf "\033[34m%s\033[0m" "$short_dir"

if [ -n "$branch" ]; then
  printf " \033[33m(%s)\033[0m" "$branch"
fi

if [ -n "$model" ]; then
  printf " \033[36m[%s]\033[0m" "$model"
fi

if [ -n "$remaining" ]; then
  printf " \033[90mctx: %s%%\033[0m" "$(printf '%.0f' "$remaining")"
fi

printf "\n"
