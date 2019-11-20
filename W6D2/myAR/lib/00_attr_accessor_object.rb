class AttrAccessorObject

  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do 
        var = '@' + name.to_s
        instance_variable_get(var)
      end

      define_method("#{name}=") do |value|
        var = '@' + name.to_s
        instance_variable_set(var,value)
      end
    end
  end

end
