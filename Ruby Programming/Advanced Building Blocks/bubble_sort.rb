def bubble_sort(arr)
  sorted = false
  until sorted
    sorted = true
    i = 0
    while i < arr.length - 1
      if arr[i+1]<arr[i]
        arr[i],arr[i+1] = arr[i+1],arr[i]
        sorted = false
      end
      i+=1
    end
  end
  arr
end

print bubble_sort([4,3,78,2,0,2]) # ==> [0, 2, 2, 3, 4, 78]


def buble_sort_by(arr)
  sorted = false
  until sorted
    sorted = true
    i = 0
    while i < arr.length - 1
      if yield(arr[i],arr[i+1]) < 0
        arr[i],arr[i+1] = arr[i+1],arr[i]
        sorted = false
      end
      i+=1
    end
  end
  arr
end

buble_sort_by(["some","random","words","thrown","together"]) do |left, right|
  right.length - left.length
end

# ==> ["some", "words", "random", "thrown", "together"]