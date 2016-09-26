module Enumerable

  def my_each
    for i in self
      yield(i)
    end
    self
  end

  def my_each_with_index
    index = 0
    for i in self
      yield(i, index)
      index += 1
    end
    self
  end

  def my_select
    selected = []
    for i in self
      selected << i if yield(i)
    end
    selected
  end

  def my_all?
  	return false unless block_given?
    condition = true
    for i in self
      return false if yield(i) == false
    end
    condition
  end

  def my_any?
	  return true unless block_given?
    condition = false
    for i in self
      return true if yield(i)
    end
    condition
  end

  def my_none?
    condition = true
    for i in self
      unless block_given?
        return false if i
        next
      end
      return false if yield(i)
    end
    condition
  end

  def my_count(num=nil)
    count = 0
    for i in self
      unless block_given?
        count += 1 if num == nil
        count += 1 if num != nil && i == num
        next
      end
      count += 1 if yield(i)
    end
    count
  end

  def my_map(proc=nil)
    mapped = []
    for i in self
      proc ? mapped << proc.call(i) : mapped << yield(i)
    end
    mapped
  end

  def my_inject(start=0)
    start = "" if self.to_a[0].to_i == 0
    memo = start
    for i in self
    	memo = yield(memo, i)
    end
    memo
  end

end
