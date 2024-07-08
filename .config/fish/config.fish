if not status is-interactive
  return
end

fish_vi_key_bindings

# General `git` cmds
abbr -a gf "git fetch"
abbr -a gpl "git pull"
abbr -a gs "git status"
abbr -a gl "git log"
abbr -a gln "git log -n"
abbr -a gd "git diff"
abbr -a gds "git diff --staged"
abbr -a ga "git add"
abbr -a gu "git restore --staged"
abbr -a gr "git restore"
abbr -a gc "git commit"
abbr -a gcm "git commit -m"
abbr -a gca "git commit --amend"
abbr -a gps "git push"

# Branch cmds
abbr -a gba "git branch"
abbr -a gbu "git branch --set-upstream-to"
abbr -a gbp "git remote update origin --prune"

# Worktree cmds
abbr -a gwp "git worktree prune -v"
abbr -a gwr "git worktree remove"

if test (uname) = "Darwin"
  set -gx HOMEBREW_PREFIX "/opt/homebrew";
  set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
  set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
  fish_add_path "/opt/homebrew/bin"
  ! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
  ! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
end

if command -sq starship
  starship init fish | source
end

if command -sq eza
  alias ls eza
end

if command -sq nvim 
  alias e nvim
end

if functions -q fzf_configure_bindings
  fzf_configure_bindings --directory=\cf
end
