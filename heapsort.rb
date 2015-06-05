def buildMaxHeap(array)
	for i in ((array.size - 1) / 2).downto(1)
		maxHeapify(array, i)
	end
end

def maxHeapify(array, i)
	l = left(i)
	r = right(i)
	if l <= array.size and array[l] > array[i]
		largest = l
	else
		largest = i
	end
	if r <= array.size and array[r] > array[largest]
		largest = r
	end
	if largest != i
		#swap(array, i, largest)
		array[i], array[largest] = array[largest], array[i]#swaps 
		maxHeapify(array, largest)
	end
end


def heapMax(array)
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

