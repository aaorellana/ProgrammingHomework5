class NodeSet

	def initialize()
		@set = Array.new
	end 
	
	#shows @set
	def show
		print @set
	end
	
	#adds u if its not in the set already
	def merge(u)
		if @set.size > 0
			for i in 0..(@set.size - 1) do
				if u.node == @set[i].node
					noinsert = 1
				end
			end
			if noinsert != 1
				@set << u
			end
		else
			@set << u
		end
	end
end