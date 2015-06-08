class MySet

	def initialize()
		@set = Set.new
	end 
	
	def show
		print @set
	end
	
	def merge(u)
		@set.merge(u)
	end
end