#no globals
#priority queue for Q

def dijkstra(arrayOfConnections, arrayOfVertices, startingNode)
	
	#vertices = Array.new struct
	
	init_single_source(vertices, startingNode)
	#S = nil
	#Q = Queue.new
	for i in 1..arrayOfVertices.size
		#Q << arrayOfVertices[i]
	end
	
	while Q != nil do
		u = Q.pop
		$S = S / u
		#for each vertex Adjacent to u
		#	relax(u, v, weight)
		#end
	end
	
	print_path(arrayOfVertices, source, v.visited)
end

def init_single_source(arrayOfVertices, source)
	vertices = Struct.new(:node, :distance, :visited)
	
	for i in 1..arrayOfVertices.size
		vertices.new(arrayOfVertices[i], INFINITY, nil)
	end
	
	source.distance = 0
	
end

def relax(u, v, weight)#v current node, u predecessor node 
	if v.distance > u.distance + weight#weight(u, v)
		v.distance = u.distance + weight#weight(u, v)
		v.visited = u
	end
end

def print_path(arrayOfVertices, source, v)
	if v == s
		print s
	elsif v.visited == nil
		print "no path from #{s} to #{v} exists"
	else
		print_path(arrayOfVertices, source, v.visited)
		print v
	end
end

def adjacent(arrayOfConnections, u)
	arrayOfConnections.select { |list|  list.first ==  u.node } 
end
