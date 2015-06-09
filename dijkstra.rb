require "./NodeSet.rb"
require "./PriorityQueue.rb"

#finds the shortest path beginning from source
def dijkstra(priorityArray, graph, startingNode)
	initSingleSource(graph, startingNode)
	set = NodeSet.new
	queue = PriorityQueue.new(graph.giveGraph, priorityArray)
	
	while !queue.empty? do
		u = queue.extractMin[0]
		set.merge(u)
		graph.adjacent(u).each {|adj| relax(u, graph.getNode(adj.first), adj.last)}
	end

end

#initializes the source node and the rest of the vertices
def initSingleSource(graph, source)
	
	for i in 0..(graph.size - 1)
		graph.changeDistance(i, Float::INFINITY)
		graph.changePredecessor(i, nil)
	end
	
	graph.initSource(source)#initializes the source node
end

#relaxes the path
def relax(u, v, weight)#v current node, u predecessor node 
	if v.distance > u.distance + weight#weight between u and v)
		v.distance = u.distance + weight#weight between u and v)
		v.predecessor = u.node
	end
end

#prints out the shortest path from source to v
def printPath(graph, source, v)
	if graph.getNode(v).node ==  graph.getNode(source).node
		print graph.getNode(source).node
	elsif graph.getNode(v).predecessor == nil
		puts "no path from #{source} to #{v} exists"
	else
		printPath(graph, source, graph.getNode(v).predecessor)
		print "-> #{v} "
	end
end

