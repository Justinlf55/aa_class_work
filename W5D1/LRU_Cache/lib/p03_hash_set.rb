require_relative "p02_hashing"
require_relative "p01_int_set"

class HashSet
  attr_reader :count

  def initialize(key_buckets = 8)
    @store = Array.new(key_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    key.is_a?(Integer) ? hashed = key : hashed = key.hash 
    unless include?(hashed)
      @count += 1
      resize! if count >= @store.length

      bucket = hashed % @store.length
      @store[bucket] << hashed
    end

  end

  def include?(key)
    key.is_a?(Integer) ? hashed = key : hashed = key.hash 
    bucket = hashed % @store.length
    @store[bucket].include?(hashed)
  end

  def remove(key)
    key.is_a?(Integer) ? hashed = key : hashed = key.hash 
    if include?(hashed)
      bucket = hashed % @store.length
      @store[bucket].delete(hashed)
      @count -= 1
    end
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
  end

  def num_buckets
    @store.length
  end

  def resize!
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
