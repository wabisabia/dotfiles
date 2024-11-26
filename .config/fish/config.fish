if not status is-interactive
  return
end

fish_vi_key_bindings

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
  set -gx EDITOR nvim
  alias e nvim
end

if command -sq git
  alias g git
end

if command -sq terraform
  alias tf terraform
end

if functions -q fzf_configure_bindings
  fzf_configure_bindings --directory=\cf
end

if command -sq gh
  function repo
    gum input | xargs gh search repos | gum choose | cut -f 1 | xargs -I{} open http://github.com/{}
  end
end
