source $HOME/.local/share/zsh/antigen.zsh


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load Bundles 
antigen bundle git
antigen bundle node
antigen bundle npm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle tmux
# antigen theme spaceship-prompt/spaceship-prompt

# Tell Antigen that you're done.
antigen apply
