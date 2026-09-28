alias ef 'hx ~/.config/fish/config.fish'
alias ev 'hx ~/.config/nvim/init.lua'
alias ecv 'hx ~/.config/nvim/lua/custom/plugins/init.lua'

alias d-c docker-compose

alias vi nvim

alias z zoxide

alias pn pnpm

alias rm trash

alias mk make
alias gcz git-cz

alias mkdir 'mkdir -p'
alias sudo 'sudo '
alias cp 'cp -i'
alias mv 'mv -i'
alias ls eza

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'



function cd
    builtin cd $argv; and ls
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

set -g theme_color_scheme zenburn
set -g theme_display_date no

export LSCOLORS="hxfxcxdxbxegedabagacad"

fish_add_path ~/go/bin
~/.local/bin/mise activate fish | source
starship init fish | source
