module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read 
      @csv_contents = []
      filename = self.class.to_s.downcase + '.csv'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def method_missing name, *args
      row_name = name.to_s
      headers = self.headers
      index = headers.find_index(row_name)
      self.csv_contents.each_with_index do |a,i|
        puts a[index]
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end


m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.one

#this is a bit silly. include a module, that auto runs a method within, that then do a call to that method to include the other methods. thats a no from me to be honest.
