#!/bin/fish

set fish_greeting

if status --is-interactive
    abbr --add --global g 'rg'
    abbr --add --global v 'nvim'
    abbr --add --global l 'exa -al'
    abbr --add --global t 'bpytop'
end
function fish_command_not_found
    echo Command not found: $argv[1]
end
