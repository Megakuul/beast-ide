# Add this to your bashrc file to use "emacshere" alias (simular to "code ." in vscode)
alias emacshere='emacs -eval "(progn (dired \".\") (split-window-right) (next-window) (find-file (dired-get-file-for-visit)))" & disown'
