require "./HeapSort.rb"

class PriorityQueue

	def initialize(structlist, array)
		@structQueue = structlist
		@arrayQueue = array
	end
	
	#sets @structQueue and @arrayQueue
	def setQueue(structlist, array)
		heapSort(structlist)
		@structQueue = structlist
		@arrayQueue = array
	end

	#decreases the key
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

	def minHeapInsert(array, key)#inserts an element to the Priority
		array[array.size] = Float::INFINITY
		heapDecreaseKey(array, array.size - 1, key)
	end

	#extracts the minimum key from an array
	def heapExtractMin(array)
		if array.size < 1
			print "heap underflow"
		end
		min = array[1]
		array[1] = array[array.size - 1]
		array.delete_at(array.size - 1)
		minHeapify(array, 1)
		return min
	end

	#extracts the min from @structQueue which is a node
	def extractMin()
		min = heapExtractMin(@arrayQueue)
		@structQueue.select {|nodes| nodes.node ==  min } 
	end
	
	#returns if @arrayQueue is empty or not
	def empty?
		if @arrayQueue.size > 1
			false
		else
			true
		end
	end
	
	#shows the @arrayQueue
	def showPriorityArray
		print @arrayQueue
	end
end
