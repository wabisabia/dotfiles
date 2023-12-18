if status is-interactive
    # Commands to run in interactive sessions can go here
		nvm use latest
		alias ls exa
		abbr -a gs "git status"
		abbr -a gd "git diff"
		abbr -a ga "git add"
		abbr -a gu "git restore --staged"
    abbr -a fo "nvim ~/.config/fish/config.fish && source ~/.config/fish/config.fish"
		fish_vi_key_bindings
end

starship init fish | source

