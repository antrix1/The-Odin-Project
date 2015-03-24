module Enumerable
  def my_each
    return to_enum if !block_given?
    for i in 0..self.size
      yield(self[i])
    end
  end

  def my_each_with_index
    return to_enum if !block_given?
    for i in 0..self.size
      yield(self[i], i)
    end
  end

  def my_select
    return to_enum if !block_given?
    arr = []
    for i in 0...self.size
      arr << self[i] if yield(self[i])
    end
    arr
  end

  def my_all?
      for i in 0..self.size
        return true if yield(self[i])
        return false
      end
  end


  def my_any?

  end

end


[1,2,4].my_each{|n| puts n}
