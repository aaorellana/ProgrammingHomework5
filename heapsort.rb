def heapSort(array)
	buildMinHeap(array)
	for i in (array.length - 1).downto(1)
		array[1], array[i] = array[i], array[1]
		minHeapify(array, 1)
	end
end

def buildMinHeap(array)
	for i in ((array.size - 1) / 2).ceil.downto(1)
		minHeapify(array, i)
	end
end

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


def heapMin(array)
	return array[1]
end


def parent(i)
	return i / 2
end

def left(i)
	return 2 * i
end

def right(i)
	return 2 * i + 1
end
