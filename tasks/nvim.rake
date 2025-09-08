CONFIG_FOLDER = "~/.config/"
DOTFILES_FOLDER = "~/.dotfiles/"
DOTFILES_REPOSITORY = "https://github.com/mhernandezve/dotfiles.git"

namespace :download do
  desc 'Download Config Files'
  task :config do
    section "Downloading Config Files in #{DOTFILES_FOLDER}"
    unless testing?
      run %(git clone #{DOTFILES_REPOSITORY} #{DOTFILES_FOLDER})
    end
  end
end

namespace :set do
  desc 'Create symlink to the nvim folder'
  task :config do
    section 'Creating a symlink to the nvim folder'
    unless testing?
      run %(ln -s ~/.dotfiles/nvim ~/.config/nvim)
    end
  end
end

namespace :apply do
  desc 'Create symlink to the config folder'
  task :config, [:folder] do |t, args|
    folder = args[:folder] || 'nvim'
    section "Creating a symlink to the #{folder} folder"
    unless testing?
      run %(ln -s #{DOTFILES_FOLDER}#{folder} #{CONFIG_FOLDER}#{folder})
    end
  end
end

namespace :update do
  desc 'Update Neovim'
  task :neovim do
    section 'Updating Neovim'
    unless testing?
      run %(nvim --headless "+Lazy! update" +qa)
    end
  end
end

