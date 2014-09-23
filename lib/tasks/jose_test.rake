desc "Lame Hello World message"
task :greet do
  puts "Hello World!"
end

desc "Prints out current date and time"
task :today => :greet do
  today = Time.new
  puts today
end

desc "Prints name of last user to register"
task :latest_user => :today do
  u = User.last
  puts "'#{u.name}' is the latest person to register on this site."
end
