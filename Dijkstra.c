#include <limits.h>
#include "Dijkstra.h"

void dijkstra(int arraySize, int array[][arraySize], int startingNode, int endingNode)
{
	int distance[arraySize];
	int nextNode = 0;
	int i;
	int j;
	int smallest;
	
	setupArray(arraySize, distance);
	
	
	/*
	for(i = 1; i < arraySize; i++)
	{
		for(j = 1; j < arraySize; j++)
		{
			if((array[i][j] < INT_MAX) || (smallest > array[i][j]))
			{
				smallest = array[i][j];
			}
		}
	}
	*/
	
}

void setupArray(int arraySize, int array[][arraySize])
{
	int i;
	int j;
	//setup 2d array to have INT_MAX elements
	for(i = 1; i < arraySize; i++)
	{
		for(j = 1; j < arraySize; j++)
		{
			array[i][j] = INT_MAX;
		}
	}
}
/*
void disjkstra(graph, begin_node, end_node)
{
	S = 0;
	Q = G.V;
	while(Q != 0)
	{
		u = extractMin(Q);
		S = S union {u}
		for each vertex v in G.Adj[u]
		{
			relax(u, v, weight);
		}
	}
}

void initializeSingleSource(G, s)
{
	for each vertex v in G.V
	{
		v.d = INT_MAX;
		v.pie = nil;
	}
	s.d = 0;
}

void relax(u, v, weight)
{
	if(v.d > u.d + weight(u, v))
	{
		v.d = u.d + weight(u, v);
		v.pie = u;
	}
}
*/