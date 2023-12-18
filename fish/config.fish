if status is-interactive
    # Commands to run in interactive sessions can go here
		nvm use latest

		alias ls exa

    abbr -a fo "nvim ~/.config/fish/config.fish && source ~/.config/fish/config.fish"

		abbr -a gs "git status"
    abbr -a gl "git log"
    abbr -a gln "git log -n"
		abbr -a gd "git diff"
		abbr -a gds "git diff --staged"
		abbr -a ga "git add"
		abbr -a gu "git restore --staged"
    abbr -a gc "git commit"
    abbr -a gcm "git commit -m"
    abbr -a gca "git commit --amend"

    abbr -a e "nvim"

		fish_vi_key_bindings
    fzf_configure_bindings --directory=\cf
end

starship init fish | source

