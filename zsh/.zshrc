#source separated files
for file in $(ls ~/dotfiles/zsh/zshrc); do
  source ~/dotfiles/zsh/zshrc/$file
done
