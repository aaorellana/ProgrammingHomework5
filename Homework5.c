#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <limits.h>

void printArray(int n, int array[][n]);
void insertWeights(int arraySize, int array[][arraySize], char *filename);


int main(int argc, char *argv[])
{  
	char *filename = argv[1];
	int arraySize = 1 + strtol(argv[2], NULL, 10); 
	int array[arraySize][arraySize];
	int startingNode = strtol(argv[3], NULL, 10);
	int endingNode = strtol(argv[4], NULL, 10);
	
	setupArray(arraySize, array);

	insertWeights(arraySize, array, filename);
	
	//dijkstra(arraySize, array, startingNode, endingNode);

	printArray(arraySize, array);

	return 0;
}

void printArray(int arraySize, int array[][arraySize])
{
	int i;
	int j;

	for(i = 1; i < arraySize; i++)
	{
		for(j = 1; j < arraySize; j++)
		{
			printf("%d ", array[i][j]);
		}
		printf("\n");
	}

}


void insertWeights(int arraySize, int array[][arraySize], char *filename)
{
	FILE *fp;
	int x;
	int y;
	int weight;
	char character;
	
	fp = fopen(filename, "r");
	
	while(character != '#')
	{
		fscanf(fp, "%c", &character);
	}
	fscanf(fp, "%c", &character);

	while(fscanf(fp, "%d %d %d\n", &x, &y, &weight) > 0)
	{ 
		array[x][y] = weight;
	}

	fclose(fp);
}