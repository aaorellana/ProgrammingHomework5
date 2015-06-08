#no globals
#priority queue for Q
#load "Set.rb"
require "set"
load "PriorityQueue.rb"

def dijkstra(priorityArray, graph, startingNode)
	
	initSingleSource(graph, startingNode)
	set = Set.new
	queue = PriorityQueue.new(graph.giveGraph, priorityArray)
	
	while queue != nil do
		u = queue.extractMin
		set.merge(u)
		#for each v Adjacent to u
		#	relax(u, v, weight)
		#end
		#for v in 0..Graph1.adjacent(u.node)
		#	relax(u, Graph1.getNode(v[i].first), v[i].last)#Graph1.getWeight(u.node, v[i].first))
		#end
		graph.adjacent(u).each {|adj| relax(u, adj.first, adj.last) }
	end
	
	#printPath(graph, source, v.predecessor)
end

def initSingleSource(graph, source)
	
	for i in 0..(graph.size - 1)
		graph.changeDistance(i, Float::INFINITY)
		graph.changePredecessor(i, nil)
	end
	
	graph.changeSource(source)
end

def relax(u, v, weight)#v current node, u predecessor node 
	if v.distance > u.distance + weight#weight(u, v)
		v.distance = u.distance + weight#weight(u, v)
		#v.predecessor = u original code
		v.predecessor = u.node
	end
end

def printPath(graph, source, v)
	if v == source
		print source
	elsif v.predecessor == nil
		print "no path from #{s} to #{v} exists"
	else
		print_path(graph, source, v.predecessor)
		print v
	end
end


