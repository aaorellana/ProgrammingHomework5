load "HeapSort.rb"


def heapDecreaseKey(array, i, key)
	if key > array[i]
		print "new key is larger than the current key"
	end
	array[i] = key
	while i > 1 and array[parent(i)] > array[i] do 
		array[i], array[parent(i)] = array[parent(i)], array[i]
		i = parent(i)
	end
end

def minHeapInsert(array, key)
	array[array.size] = Float::INFINITY
	heapDecreaseKey(array, array.size - 1, key)
end

def heapExtractMin(array)#extracts the minimum key
	if array.size < 1
		print "heap underflow"
	end
	min = array[1]
	array[1] = array[array.size - 1]
	array.delete_at(array.size - 1)
	minHeapify(array, 1)
	return min
end

