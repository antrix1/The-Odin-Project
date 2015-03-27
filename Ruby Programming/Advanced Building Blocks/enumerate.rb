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

  def my_any?
    counter = 0
    for i in 0..self.size-1
      if !block_given? && (self[i] != false || self[i] != false)
        counter += 1
      end
      if block_given? && self[i] != false && self[i] != nil && yield(self[i])
        counter += 1
      end
    end
    return false if counter == 0
    return true if counter > 0
  end

  def my_none?
    counter = 0
    for i in 0..self.size-1
      if !block_given? && (self[i] === false || self[i] === nil)
        counter += 1
      end
      if block_given? && (self[i] == false || self[i] == nil || !yield(self[i]))
        counter += 1
      end
    end
    return false if counter != self.size
    return true if counter == self.size
  end

  def my_count(arg=nil)
    counter = 0
    for i in 0..self.size-1
      if !block_given? && arg==nil
        counter = self.size
      elsif block_given?
        counter += 1 if yield(self[i])
      else
        counter += 1 if self[i] == arg
      end
    end
    counter
  end

  def my_map(&proc)
    arr = []
    return to_enum if !block_given?
    for i in 0..self.size-1
      arr.push(self[i]) if !proc && yield(self[i])
      arr.push(self[i]) if proc && proc.call(self[i])
    end
    arr
  end

  def my_inject(arg=0)
    for i in 0..self.size-1
      arg = yield(arg, self[i])
    end
    arg
  end

end

