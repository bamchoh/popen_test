puts "start exec1"
$stdout.flush
loop do
  input = gets
  next if input.nil?
  case input.chomp
  when "exit"
    puts "exit exec1"
    $stdout.flush
    break
  else
    puts "input: #{input}"
    $stdout.flush
  end
end
