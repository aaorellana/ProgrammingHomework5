require "./Main.rb"

var1 = Main.new("test.tgf", 1, 7)
var2 = Main.new("test.tgf", 1, 6)


caughtString = String.new
caughtString = `ruby Homework5.rb "test.tgf" 1 7`

#asserts first and second are equal
def assert(first, second)
	if first == second
		puts "Test Passed"
	else
		puts "Test Failed #{first} != #{second}"
	end
end

assert(caughtString, "1-> 3 -> 6 -> 7 ")

caughtString = `ruby Homework5.rb "test.tgf" 1 6`
assert(caughtString, "1-> 3 -> 6 ")

caughtString = `ruby Homework5.rb "test.tgf" 1 2`
assert(caughtString, "1-> 2 ")

caughtString = `ruby Homework5.rb "test.tgf" 1 4`
assert(caughtString, "1-> 2 -> 4 ")

caughtString = `ruby Homework5.rb "test.tgf" 1 3`
assert(caughtString, "1-> 3 ")

caughtString = `ruby Homework5.rb "test.tgf" 5 6`
assert(caughtString, "5-> 7 -> 6 ")

caughtString = `ruby Homework5.rb "test.tgf" 3 4`
assert(caughtString, "3-> 4 ")

caughtString = `ruby Homework5.rb "test.tgf" 3 5`
assert(caughtString, "3-> 5 ")

caughtString = `ruby Homework5.rb "test.tgf" 3 3`
assert(caughtString, "3")

caughtString = `ruby Homework5.rb "test.tgf" 1 1`
assert(caughtString, "1")

caughtString = `ruby Homework5.rb "test.tgf" 5 5`
assert(caughtString, "5")