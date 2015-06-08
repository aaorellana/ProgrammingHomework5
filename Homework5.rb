load "Graph.rb"
load "HeapSort.rb"
#load "Dijkstra.rb"

Graph1 = Graph.new

=begin
Graph1.insert_vertice(0, 0, 0)
Graph1.insert_vertice(2, 0, 0)
Graph1.insert_vertice(5, 0, 0)
Graph1.insert_vertice(1, 0, 0)
#Graph1.show

t = [0, 2, 5, 1]

heapSort(t, Graph1)

print t
Graph1.show

#Graph1.change_distance(0, 5)

#Graph1.show
=end


nameOfFile = ARGV[1]
numberOfNodes = ARGV[2]
startingNode = ARGV[3]
endingNode = ARGV[4]
arrayOfVertices = Array.new
arrayOfConnections = Array.new
priorityArray = Array.new
trigger = 0
	
File.open("test.tgf", "r") do |f| #read the tgf file
	
	f.each_line do |line|
		if line.include?('#')
			trigger = 1	
		end
		if trigger == 0
			tokens = line.split(" ")
			Graph1.insertVertice(tokens[0].to_i, 0, 0)
			priorityArray << tokens[0].to_i
		end
		if trigger == 1 and !line.include?('#')
			tokens = line.split(" ")
  			arrayOfConnections << [tokens[0].to_i, tokens[1].to_i, tokens[2].to_i]
		end
  	end

end

adjArray = Array.new

#creates the adjacency list
for i in 0..(priorityArray.size - 1)
	adjArray << [priorityArray[i]]
	for j in 0..(arrayOfConnections.size - 1)
		if priorityArray[i] == arrayOfConnections[j].first
			adjArray.last << arrayOfConnections[j].slice(1, 2)
		end
	end
end


Graph1.setAdjacency(adjArray)

#print Graph1.getWeight(4, 1)
#print Graph1.getNode(1)
Graph1.changeSource(1)

