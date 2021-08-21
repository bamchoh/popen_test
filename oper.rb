require "open3"

stdin1, stdout1, wait_thr1 = Open3.popen2(*%w(ruby exec1.rb), pgroup: false)
stdin2, stdout2, wait_thr2 = Open3.popen2(*%w(ruby exec2.rb), pgroup: false)

Thread.new do
  puts "[exec1] #{stdout1.readline}"
  loop do
    stdin1.puts stdout2.readline.chomp
    puts "[exec1] #{stdout1.readline}"
  end
end

sleep 5
wait_thr2.kill
wait_thr1.kill
