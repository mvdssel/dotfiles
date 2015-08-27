VIM Cheatsheet
==============

Embed vim commands in source file
---------------------------------
Use comments and 'vim' prefix.

    Example in Tex:
        % vim: set spelllang=en : set sw=4 : 
    Example in HTML:
        <!-- vim: set spelllang=en : set sw=4 : -->

Actions
-------
- `~` — naar uppercase
- `r` — replace character
- `J` — join the line below to the current one
- `.` — repeat last action
- `gv` — repeat last selection

Movement
--------
- `*` — next occurence of the current word
- `#` — previous occurenct of the current word
- `%` — matching bracket ()[]{}
- `'.` — go to last change
- `130|` — go to column 130 of the cursor-line

Buffers & tabs
--------------
Move the active buffer to the right / left / ...

    <Ctrl-w>[HJKL]

Set the active tab at certain place

    tabm 2

Folds
-----
- `zx` — Update folds
- `zd` — Delete the fold at the cursor

Spelling
--------
Where LL is the language and EEE is the encoding of the file in
the active window. For example, if you are editing a file whose
encoding is UTF-8, with spelllang set to en_us then Vim will
look for a spell file at `~/.vim/spell/en.utf-8.add`.

To add a word to this spellfile: `zg`

Remove a word from this spellfile: `zw`

Undo versions for these commands `zug` and `zuw` respectively.


Plugins
-------
Shows syntastic errors

    :Errors

Manual syntax checking
    
    :SyntasticToggleMode    # disable syntastic
    :SyntasticCheck         # run syntax check

Detects filetype

    :filetype detect

Change $CWP to something meaningfull

    cd in NERDTreeCWD

Special characters
------------------
Maak gebruik van de zogenaamde digraphs

    CTRL-K a:       ä
    CTRL-K e>       ê

    Ct ¢  162    Pd £  163    Cu ¤  164    Ye ¥  165
    e! è  232    e' é  233    e> ê  234    e: ë  235

Encoding
--------
Change the output encoding that is shown in the terminal

    :set encoding=utf-8

Change the output encoding of the file that is written

    :set fileencoding=utf-8

