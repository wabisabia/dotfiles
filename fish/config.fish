if status is-interactive
    # Commands to run in interactive sessions can go here
		nvm use latest
		alias ls exa
		fish_vi_key_bindings
		alias cswk="cd ~/dev/uni/high-performance-computing/cswk/cfd/"
end

starship init fish | source
