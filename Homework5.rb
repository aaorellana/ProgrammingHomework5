nameOfFile = ARGV[1]
numberOfNodes = ARGV[2]
startingNode = ARGV[3]
endingNode = ARGV[4]
arrayOfVertices = Array.new
arrayOfConnections = Array.new
trigger = 0
	
File.open("test.tgf", "r") do |f| #read the tgf file
	
	f.each_line do |line|
		if line.include?('#')
			trigger = 1	
		end
		if trigger == 0
			arrayOfVertices << line
		end
		if trigger == 1 and !line.include?('#')
			tokens = line.split(" ")
  			arrayOfConnections << [tokens[0], [tokens[1], tokens[2]]]
		end
  	end

end
	
#print arrayOfConnections	