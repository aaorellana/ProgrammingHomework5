#no globals
#priority queue for Q
load "Set.rb"

def dijkstra(arrayOfConnections, graph, startingNode)
	
	init_single_source(graph, startingNode)
	set = MySet.new
	queue = queue #arrayOfConnections
	
	while queue != nil do
		u = queue.extractMin
		set.merge(u)
		#for each v Adjacent to u
		#	relax(u, v, weight)
		#end
		#for v in 0..Graph1.adjacent(u.node)
		#	relax(u, Graph1.getNode(v.first.to_i), Graph1.getWeight(u.node, v.first.to_i))
		#end
	end
	
	#print_path(arrayOfVertices, source, v.ancestor)
end

def init_single_source(graph, source)
	
	for i in 0..(graph.size - 1)
		graph.changeDistance(i, Float::INFINITY)
		graph.changeAncestor(i, nil)
	end
	
	graph.changeSource(source)
end

def relax(u, v, weight)#v current node, u predecessor node 
	if v.distance > u.distance + weight#weight(u, v)
		v.distance = u.distance + weight#weight(u, v)
		v.ancestor = u
	end
end

def print_path(graph, source, v)
	if v == source
		print source
	elsif v.ancestor == nil
		print "no path from #{s} to #{v} exists"
	else
		print_path(graph, source, v.ancestor)
		print v
	end
end

