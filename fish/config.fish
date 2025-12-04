if not status is-interactive
  return
end

fish_config theme choose kanagawa

set fish_greeting

fish_vi_key_bindings

bind -M insert ctrl-n down-or-search
bind -M insert ctrl-p up-or-search
bind -M insert ctrl-y accept-autosuggestion
bind -M insert ctrl-n complete
bind -m insert ctrl-_ history-pager repaint-mode

if command -sq starship
  starship init fish | source
end

if command -sq yazi
  function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
      builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
  end
end

if command -sq eza
  alias ls eza
  alias l 'eza -l'
end

if command -sq zoxide
  zoxide init fish | source
end

if command -sq nvim 
  set -gx EDITOR nvim
else
  set -gx EDITOR vim
end

if command -sq jj
  alias j 'jj'
  alias ja 'jj absorb'
  alias jb 'jj bookmark'
  alias jc 'jj commit'
  alias jd 'jj diff'
  alias je 'jj edit'
  alias jf 'jj edit -r @+'
  alias jl 'jj log'
  alias jn 'jj new'
  alias jr 'jj rebase'
  alias js 'jj status'
  alias ju 'jj undo'
  alias jab 'jj abandon'
  alias jaf 'set -l files (jch); test -n "$files"; and jj absorb $files'
  alias jai 'jj absorb --interactive'
  alias jba 'jj bookmark advance'
  alias jbc 'jj bookmark create'
  alias jbd 'jj bookmark delete'
  alias jbl 'jj bookmark list'
  alias jbm 'jj bookmark move'
  alias jbr 'jj bookmark rename'
  alias jbs 'jj bookmark set'
  alias jbt 'jj bookmark track'
  alias jbu 'jj bookmark untrack'
  alias jde 'jj diffedit'
  alias jdl 'jj diff -r @-'
  alias jds 'jj desc'
  alias jel 'jj edit -r @-'
  alias jdt 'jj diff --tool dt'
  alias jla 'jj log -r "all()"'
  alias jlb 'jj log -r branch'
  alias jnx 'jj next'
  alias jpl 'jj git fetch'
  alias jpr 'jj pr'
  alias jps 'jj git push'
  alias jrs 'jj restore'
  alias jsh 'jj show'
  alias jsp 'jj split'
  alias jsq 'jj squash'
  alias jabl 'jj abandon -r @-'
  alias jafl 'jj absorb --from @-'
  alias jaif 'set -l files (jch); test -n "$files"; and jj absorb $files --interactive'
  alias japs 'jj absorb && jj git push'
  alias jbal 'jj bookmark advance --to @-'
  alias jdsl 'jj describe -r @-'
  alias jpsd 'jj git push --deleted'
  alias jrsi 'jj restore --interactive'
  alias jsfl 'jj squash --from @-'
  alias jshl 'jj show -r @-'
  alias jspl 'jj split -r @-'
  alias jsqi 'jj squash --interactive'
  alias jaips 'jj absorb --interactive && jj git push'
  alias jafps 'jaf && jj git push'
  alias jbaps 'jj bookmark advance && jj git push'
  alias jspif 'set -l files (jch); test -n "$files"; and jj split $files --interactive'
  alias jsqps 'jj squash && jj git push'
  alias jbalps 'jj bookmark advance --to @- && jj git push'
  alias jsqips 'jj squash --interactive && jj git push'

  function jch -a revset
    if test -n "$revset"
      set -l revset_arg "-r '$revset'"
    end
    jj diff --summary $revset_arg | rg '^[MA]' | cut -d' ' -f2 | fzf --preview="jj diff $revset_arg {}" --multi --cycle
  end

  function jw -a revset
    set -l files (jch $revset)
    if test -n "$files"
      $EDITOR $files
    end
  end

  function jwl
    jw @-
  end

  function jres
    set -l files (jj resolve --list | rg '2-sided conflict$' | tr -s ' ' | cut -d' ' -f1)
    if test -n "$files"
      $EDITOR $files
    end
  end
end

if command -sq blueutil
  function b
    blueutil --connect (blueutil --paired | fzf | string sub -s 10 -l 17)
  end
end

if command -sq docker
  alias d docker
  alias dc 'docker compose'
end

if command -sq terraform
  alias tf 'terraform'
  alias tfa 'terraform apply'
  alias tfi 'terraform import'
  alias tfp 'terraform plan'
  alias tfs 'terraform state'
  alias tfv 'terraform validate'
  alias tfw 'terraform workspace'
  alias tfws 'terraform workspace select'
end

if command -sq kubectl
  alias k kubectl
end

if command -sq fzf
  fzf_configure_bindings --directory=ctrl-f
end

if command -sq aws_completer
  # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
  complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
end

if command -sq direnv
  direnv hook fish | source
end

# uv
fish_add_path "/Users/chrisd/.local/bin"

if command -sq tmux; and not set -q TMUX; and not tmux a 2>/dev/null
  tmux
end
