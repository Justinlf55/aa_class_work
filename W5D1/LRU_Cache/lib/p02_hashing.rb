class Integer
  # Integer#hash already implemented for you


end

class Array
  def hash
    alpha = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a 

    hashed = []
    hashed << 404 if self.empty?
    self.each_with_index do |el,i| 
      if alpha.include?(el)
        hashed << i + alpha.index(el)
      elsif el.is_a?(Array)
        hashed << 50 * (el.hash + 1)
      elsif el.is_a?(Hash)
        hashed << 30 * (el.hash + 2)

      else
        hashed << '0'
      end
    end
    hashed.join('').to_i
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a + ('A'..'Z').to_a + ("0".."9").to_a 

    hashed = []
    hashed << 403 if self.empty?
    self.each_char.with_index do |el,i| 
      if alpha.include?(el)
        hashed << i + alpha.index(el)
      else
        hashed << '0'
      end
    end
    hashed.join('').to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alpha = ('a'..'z').to_a + ('A'..'Z').to_a + ("0".."9").to_a 

    hashed = 0
    hashed << 415 if self.empty?
    # self.each.with_index do |k,v,i|
    self.each do |k,v|

      case k.class
      when Integer
        hashed += 10 * v.to_s.hash
      when String
        hashed += 12 * v.hash 
      else
        hashed += 25 * v.hash 
      end

      case v.class
      when Integer
        hashed += 2 * v.to_s.hash
      when String
        hashed += 2 * v.hash 
      when Array
        hashed += 3 * v.hash 
      when Hash
        hashed += 5 * v.hash 
      # else
      #   hashed << 13 * v.hash 
      end
    end
    # hashed.join('').to_i
    hashed
  end
end
