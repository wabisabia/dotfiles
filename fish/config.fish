if not status is-interactive
  return
end

set fish_greeting

if not set -q TMUX
  if not tmux a
    tmux
  end
end

fish_vi_key_bindings

if command -sq starship
  starship init fish | source
end

if command -sq eza
  alias ls eza
end

if command -sq zoxide
  zoxide init fish | source
end

if command -sq nvim 
  set -gx EDITOR nvim
end

if command -sq jj
  set -gx JJ_CONFIG ~/.config/jj/config.toml
  alias j 'jj log'
  alias ja 'jj absorb'
  alias jd 'jj diff'
  alias je 'jj edit'
  alias jl 'jj log'
  alias jn 'jj new'
  alias jr 'jj rebase'
  alias js 'jj status'
  alias ju 'jj undo'
  alias jab 'jj abandon'
  alias jbc 'jj bookmark create'
  alias jbm 'jj bookmark move'
  alias jsh 'jj show'
  alias jsq 'jj squash'
end

if functions -q fzf_configure_bindings
  fzf_configure_bindings --directory=\cf
end
