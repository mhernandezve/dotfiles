namespace :update do
  desc 'Install Neovim'
  task :neovim do
    section 'Installing Neovim'
    unless testing?
      run %(nvim --headless "+Lazy! update" +qa)
    end
  end
end

namespace :download do
  desc 'Download Config Files'
  task :config do
    section 'Downloading Config Files'
    unless testing?
      run %(git clone https://github.com/mhernandezve/dotfiles.git ~/.config/.dotfiles)
    end
  end
end
