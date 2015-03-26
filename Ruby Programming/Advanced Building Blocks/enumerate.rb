module Enumerable
  def my_each
    return to_enum if !block_given?
    for i in 0..self.size-1
      yield(self[i])
    end
  end

  def my_each_with_index
    return to_enum if !block_given?
    for i in 0..self.size-1
      yield(self[i], i)
    end
  end

  def my_select
    return to_enum if !block_given?
    arr = []
    for i in 0...self.size-1
      arr << self[i] if yield(self[i])
    end
    arr
  end

    def my_all?
      counter = 0
      for i in 0..self.size-1
        if !block_given? && (self[i] === false || self[i] === nil)
          counter += 1
        end
        if block_given? && (self[i] == false || self[i] == nil || yield(self[i]) == false || yield(self[i]) == nil)
          counter += 1
        end
      end
      return true if counter == 0
      return false if counter > 0
    end

end

puts [1,2,false].my_all?
