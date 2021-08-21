r, w = IO.pipe

th1 = Thread.new do
  w.print "foo\r\n"
  w.flush
  w.close
end

while char = r.getc
  p char
end

