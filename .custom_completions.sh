#!/bin/zsh

_gemopencomplete() {
    local cmd=${COMP_WORDS[0]}
    local subcmd=${COMP_WORDS[1]}
    local cur=${COMP_WORDS[COMP_CWORD]}

    case "$subcmd" in
        open)
            words=`ruby -e 'puts Dir["{#{Gem::Specification.dirs.join(",")}}/*.gemspec"].collect {|s| File.basename(s).gsub(/\.gemspec$/, "")}'`
            ;;
        *)
            return
            ;;
    esac

    COMPREPLY=($(compgen -W "$words" -- $cur))
    return 0
}

complete -o default -F _gemopencomplete gem

