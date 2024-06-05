class ActsAsCSV
  def read 
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(', ') #i guess this only takes in the first 

    file.each do |row| 
      @result << row.comp.split(', ') # i guess << reads into var
    end
  end

  def headers
    @headers
  end

  def csv_contents
    @results
  end

  def initialize
    @result = []
    read
  end
end

class RubyCsv < ActsAsCSV
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
