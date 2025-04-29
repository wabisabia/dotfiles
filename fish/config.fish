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
  alias jbd 'jj bookmark delete'
  alias jbl 'jj bookmark list'
  alias jbm 'jj bookmark move'
  alias jbt 'jj bookmark track'
  alias jbu 'jj bookmark untrack'
  alias jds 'jj desc'
  alias jpl 'jj git fetch'
  alias jps 'jj git push'
  alias jsh 'jj show'
  alias jsp 'jj split'
  alias jsq 'jj squash'
end

if command -sq terraform
  alias tf terraform
end

if functions -q fzf_configure_bindings
  fzf_configure_bindings --directory=\cf
end
