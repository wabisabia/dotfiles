if not status is-interactive
  return
end

set fish_greeting

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
  alias j 'jj'
  alias ja 'jj absorb'
  alias jc 'jj commit'
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
  alias jde 'jj diffedit'
  alias jds 'jj desc'
  alias jpl 'jj git fetch'
  alias jpr 'jj pr'
  alias jps 'jj git push'
  alias jsh 'jj show'
  alias jsp 'jj split'
  alias jsq 'jj squash'
end

if command -sq terraform
  alias tf terraform
end

if command -sq kubectl
  alias k kubectl
end

if functions -q fzf_configure_bindings
  fzf_configure_bindings --directory=\cf
end

if command -sq tmux; and not set -q TMUX; and not tmux a 2>/dev/null
  tmux
end
