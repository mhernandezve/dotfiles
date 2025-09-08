Dir.glob('tasks/**/*').map { |r| load r }

# Define a task with prerequisites
task :build => [:clean, :compile] do
  puts "Building the project..."
end

# Define a task with prerequisites
desc "Updating nvim"
task :download_config do
  Rake::Task['download:config'].invoke
end

# Define a task with prerequisites
desc "Download Config Files"
task :configure do
  Rake::Task['download:config'].invoke
  Rake::Task['apply:config'].invoke('nvim')
  Rake::Task['update:neovim'].invoke
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

# Define a default task (runs when 'rake' is executed without arguments)
task :default => :configure

