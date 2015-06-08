class Graph
	def initialize()
		@graph = Array.new
		@vertice = Struct.new(:node, :distance, :predecessor)
		@adjacencylist = Array.new
	end
	
	def giveGraph()
		return @graph
	end
	
	#inserts a new vertice to the graph
	def insertVertice(node, distance, predecessor)
		@graph << @vertice.new(node, distance, predecessor)
	end
	
	#prints out the array of vertices
	def show
		puts @graph
	end

	#gives the size of the graph
	def size
		@graph.size
	end
	
	#changes the value of the distance given the index and the new value
	def changeDistance(i, distance)
		@graph[i].distance = distance
	end
	
	#changes the value of the predecessor given the index and the new value
	def changePredecessor(i, predecessor)
		@graph[i].predecessor = predecessor
	end
	
	#sets the adjacencylist
	def setAdjacency(list)
		@adjacencylist = list
	end
	
	#prints out the adjacencylist
	def showAdjacencyList
		print @adjacencylist
	end
	
	#looks for nodes that are adjacent to node
	def adjacent(node)#node is the int for the vertice
		temp = @adjacencylist.select {|list| list.first ==  node } 
		temp.first.shift
		return temp.first
	end
	
	#gets the node given the name
	def getNode(name)#name is the int for the vertice
		@graph.select {|nodes| nodes.node ==  name } 
	end
	
	#gets the weight between node u and v
	def getWeight(u, v)#u is the int name of u v is the int name for v
		temp = adjacent(u).select {|node| node.first == v}
		return temp.first[1]
	end
	
	def changeSource(source)
		for i in 0..(@graph.size - 1)  do
			if @graph[i].node == source
				@graph[i].distance = 0
				break
			end 
		end
	end
	
end