require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2("SELECT * FROM #{self.table_name}")
    @columns.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do 
        self.attributes[col]
      end

      define_method("#{col}=") do |value|
        self.attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    table_name = table_name
  end

  def self.table_name
    self.table_name = self.to_s.downcase + 's'
  end

  def self.all
    results = DBConnection.execute("SELECT * FROM #{self.table_name}")
    parse_all(results)
  end

  def self.parse_all(results)
    results.map{ |result| self.new(result) }
  end

  def self.find(id)
    self.all[id - 1]
  end

  def initialize(params = {})
    params.each do |key,value|
      if !self.class.columns.include?(key.to_sym)
        raise "unknown attribute '#{key}'" 
      else
        self.send("#{key}=",value)
      end
    end


  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.attributes.values
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
