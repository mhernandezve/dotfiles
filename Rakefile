Dir.glob('tasks/**/*').map { |r| load r }

# Define a simple task
task :hello do
  puts "Hello from Rake!"
end

# Define a task with prerequisites
task :build => [:clean, :compile] do
  puts "Building the project..."
end

# Define a task with prerequisites
desc "Updating nvim"
task :nvim_update do
  Rake::Task['update:neovim'].invoke
end

# Define a task with prerequisites
desc "Download Config Files"
task :configure_neovim do
  Rake::Task['download:config'].invoke
  Rake::Task['apply:config'["nvim"]].invoke
  Rake::Task['update:neovim'].invoke
end

# Define a default task (runs when 'rake' is executed without arguments)
task :default => :configure_neovim

# Define a task with a description
desc "Cleans temporary files"
task :clean do
  puts "Cleaning temporary files..."
  # Add your cleaning logic here
end

# Define a task with arguments
task :new_file, [:filename] do |t, args|
  if args[:filename].nil?
    puts "Please provide a filename: rake new_file[my_file.txt]"
  else
    File.open(args[:filename], "w") { |f| f.puts "New file content." }
    puts "Created #{args[:filename]}"
  end
end
