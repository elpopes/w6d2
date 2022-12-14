require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    self.table_name

  end

  def self.finalize!
    self.tablelize!
  end

  def self.table_name=(table_name)
    @@table_name = table_name
  end

  def self.table_name
    self.to_s.tableize
  end

  def self.all
    self.parse_all(DBConnection.execute(<<-SQL))
    SQL
  end

  def self.parse_all(results)
    self.all
  end

  def self.find(id)
    self.all
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    
  end

  def attribute_values
    # ...
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


class Bro
    def self.method_missing(*args)
        "I'm a bro"
    end
end