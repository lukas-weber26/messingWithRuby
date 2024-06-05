re = /x/
File.foreach("testfile.txt") { |line| puts (line) unless !re.match?(line)}
