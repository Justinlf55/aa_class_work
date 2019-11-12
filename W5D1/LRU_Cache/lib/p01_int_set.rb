require "byebug"

class MaxIntSet
  attr_reader :store, :max
  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    raise 'Out of bounds' if is_valid?(num) 

    @store[num] = true
  end

  def remove(num)
    raise 'Out of bounds' if is_valid?(num)
    @store[num] = false

  end

  def include?(num)
    raise 'Out of bounds' if is_valid?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num > @max || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % @store.length
    @store[bucket] << num
  end

  def remove(num)
    bucket = num % @store.length
    @store[bucket].delete(num)
  end

  def include?(num)
    bucket = num % @store.length
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # count += 1 unless @store.include?(num)
    unless include?(num)
      @count += 1
      resize! if count >= @store.length

      bucket = num % @store.length
      @store[bucket] << num
    end
  end

  def remove(num)
    # @store[bucket].delete(num) if @store.include?(num)
    if include?(num)
      bucket = num % @store.length
      @store[bucket].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket = num % @store.length
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    # debugger
    current_size = @store.length
    current_numbers = @store.dup.flatten

    new_store = Array.new(current_size * 2) { Array.new }

    current_numbers.each do |num| 
      bucket = num % new_store.length
      new_store[bucket] << num  
    end

    @store = new_store
  end
end
