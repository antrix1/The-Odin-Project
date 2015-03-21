def stock_picker(arr)
  result = []
  biggest_profit = 0
  counter = (0..arr.length-1).to_a

  counter.each do |i|
    counter.each do |j|
      if j > i
        if arr[j] - arr[i] > biggest_profit
          biggest_profit = arr[j] - arr[i]
          result = [i,j]
        end
      end
    end
  end
  result
end


puts stock_picker([17,3,6,9,15,8,6,1,10])