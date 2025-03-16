if not status is-interactive
  return
end

set fish_greeting

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
end

if functions -q fzf_configure_bindings
  fzf_configure_bindings --directory=\cf
end

