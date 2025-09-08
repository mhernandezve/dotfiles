require 'rake'

CONFIG_FOLDER = "~/.config/"
DOTFILES_FOLDER = "~/.dotfiles/"
DOTFILES_REPOSITORY = "https://github.com/mhernandezve/dotfiles.git"

namespace :download do
  desc 'Download Config Files'
  task :config do
    section "Downloading Config Files in #{DOTFILES_FOLDER}"
    unless testing?
      if directory_exists?(File.expand_path(DOTFILES_FOLDER))
        Dir.chdir(File.expand_path(DOTFILES_FOLDER)) do
          puts Dir.pwd
          run %(git pull origin $(git rev-parse --abbrev-ref HEAD))
        end
        puts Dir.pwd
        puts "~> The folder #{DOTFILES_FOLDER} already exists. Skipping clone."
      else
        run %(git clone #{DOTFILES_REPOSITORY} #{DOTFILES_FOLDER})
      end
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

