# inspired by https://gist.github.com/daboross/ce6a5a9f8d14bd4974c5f43b90dfdfaa

# line numbers
add-highlighter global/ number-lines
# TODO: do I _have_ to use rgb here?
set-face global LineNumbers rgb:707070,default

# helper popups
set -add global autoinfo normal
set global ui_options ncurses_assistant=off

set global autowrap_fmtcmd 'fmt -w %c'

# global: wrap to 100 characters (unless FT override, below)
add-highlighter global/ wrap -width 101 -indent -word
set global autowrap_column 101

# global: 4 space indents (unless FT override, below)
set global tabstop 4
hook global InsertChar \t %{ exec -draft -itersel h@ } -group kakrc-replace-tabs-with-spaces

#### FT overrides ####
hook global WinSetOption filetype=rust %{
    set buffer formatcmd 'rustfmt'
    set buffer tabstop 4
    set buffer indentwidth 4
    add-highlighter buffer/ wrap -word -width 120
    set buffer autowrap_column 120
}

hook global WinSetOption filetype=python %{
    set buffer tabstop 4
    set buffer indentwidth 4
    add-highlighter buffer/ wrap -word -width 79
    set buffer autowrap_column 79
}
