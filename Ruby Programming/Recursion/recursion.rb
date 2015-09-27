def append(arr, n)
  n >= 0 ? arr.push(n) && append(arr, n-1) : arr
end

p append [6,5], 4 # ==> [6, 5, 4, 3, 2, 1, 0]


def fib(n)
  n < 3 ?  1 : fib(n-1) + fib(n-2)
end

p fib(6) # ==> 8


def merge_sort(arr)
  arr.length <= 1 ? arr : merge(merge_sort(arr[0..arr.length/2-1]), merge_sort(arr[arr.length/2..-1]))
end

def merge(first, second, arr = [])
  first[0] <= second[0] ? arr.push(first.shift) : arr.push(second.shift) until first.empty? || second.empty?
  arr + first + second
end

p merge_sort [5,1,3,6,18,11,0,7,8,8,15,10] # ==> [0, 1, 3, 5, 6, 7, 8, 8, 10, 11, 15, 18]
