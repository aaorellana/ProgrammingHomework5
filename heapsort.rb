#sorts the array using heapsort functions
def heapSort(array)
	buildMinHeap(array)
	for i in (array.length - 1).downto(1)
		array[1], array[i] = array[i], array[1]
		minHeapify(array, 1)
	end
end

#build the min heap
def buildMinHeap(array)
	for i in ((array.size - 1) / 2).ceil.downto(1)
		minHeapify(array, i)
	end
end

#heapifies with min
def minHeapify(array, i)
	l = left(i)
	r = right(i)
	if l <= (array.size - 1) and array[l] < array[i]
		smallest = l
	else
		smallest = i
	end
	if r <= (array.size - 1) and array[r] < array[smallest]
		smallest = r
	end
	if smallest != i
		array[i], array[smallest] = array[smallest], array[i]#swaps array[i] with array[smallest]
		minHeapify(array, smallest)
	end
end

#returns the smallest element
def heapMin(array)
	return array[1]
end

#gives the index of the parent
def parent(i)
	return i / 2
end

#gives the index of the left child
def left(i)
	return 2 * i
end

#gives the index of the right child
def right(i)
	return 2 * i + 1
end
