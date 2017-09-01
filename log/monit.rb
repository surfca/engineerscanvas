ARGF.each do |line|
  m = /POST/.match(line)
  if m
    puts line
  end
end