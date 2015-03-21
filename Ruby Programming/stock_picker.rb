def stock_picker(arr = [])
  min = arr.min
  max = arr.max

  if arr.index(min) < arr.index(max)
    return min,max

  else
    arr.each do |e|
      if max == e && arr.index(min) > arr.index(max)
        arr[arr.index(max)] = -999
        max = arr.max
      end
    end
    return min,max
  end
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
