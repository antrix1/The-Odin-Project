def add(a, b)
	a + b
end

def subtract(a, b)
	a - b
end

def sum(input)
	sum = 0
	input.each{|a| sum+=a}
	sum
end

def multiply(*a)
	sum = 1
	a.each{|x| sum *= x}
	sum
end

def power(a, b)
	a ** b
end

def factorial(a)
	if (a <= 1)
		1
	else
		a * factorial(a-1)
	end
end