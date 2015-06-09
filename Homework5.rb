require "./Graph.rb"
require "./Dijkstra.rb"

class Main
	def initialize(ar0, ar1, ar2)
		@graph1 = Graph.new

		@nameOfFile = ar0
		@startingNode = ar1.to_i
		@endingNodeNode = ar2.to_i
		@arrayOfVertices = Array.new
		@arrayOfConnections = Array.new
		@priorityArray = Array.new
		@adjArray = Array.new
		@trigger = 0
	end

	def start
		#reads files and initializes variables
		self.readFile
	
		#creates adjacency list
		self.createAdjacencyList
	
		#initializes the @graph1 and runs dikjstra
		self.initAndRun
	end	

	def readFile
		#reads the tgf file
		File.open(@nameOfFile, "r") do |f| 
	
			f.each_line do |line|
				if line.include?('#')
					@trigger = 1	
				end
				if @trigger == 0
					tokens = line.split(" ")
					@graph1.insertVertice(tokens[0].to_i, 0, 0)#adds vertices into the @graph1
					@priorityArray << tokens[0].to_i
				end
				if @trigger == 1 and !line.include?('#')
					tokens = line.split(" ")
					@arrayOfConnections << [tokens[0].to_i, tokens[1].to_i, tokens[2].to_i]#creates the array of connections
				end
			end

		end
	end

	def createAdjacencyList
		#creates the adjacency list
		for i in 0..(@priorityArray.size - 1)
			@adjArray << [@priorityArray[i]]
			for j in 0..(@arrayOfConnections.size - 1)
				if @priorityArray[i] == @arrayOfConnections[j].first
					@adjArray.last << @arrayOfConnections[j].slice(1, 2)
				end
			end
		end
	end

	def initAndRun
		#adds an element to the beginnning of the array to have the heap start at index 1
		@priorityArray.unshift(0)

		#sets the adjacency array into the @graph1
		@graph1.setAdjacency(@adjArray)

		#finds the shortest path from the starting node
		dijkstra(@priorityArray, @graph1, @startingNode)

		#prints out the path
		printPath(@graph1, @startingNode, @endingNodeNode)

	end
	
end

main = Main.new(ARGV[0], ARGV[1], ARGV[2])
main.start


