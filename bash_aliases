# Attach to emacs server with new frame
alias emacs='emacsclient -a emacs -n -c'

# Attach to emacs server using existing frame
alias emacsd='emacsclient -a emacs -n'

# Create new instance of emacs
alias emacsp='command emacs'

# Print symbolic and octal file mode
alias mode='stat -c "%A (%a) %n"'

# Quick way to run django test server
alias mrs='./manage.py runserver'
