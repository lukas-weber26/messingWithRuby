class ActsAsCSV
  def self.acts_as_csv
  define_method 'read' do 
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(', ') #i guess this only takes in the first 

    file.each do |row| 
      @result << row.comp.split(', ') # i guess << reads into var
    end
  end

  define_method 'headers' do
    @headers
  end

  define_method 'csv_contents' do
    @results
  end

  define_method 'initialize' do
    @result = []
    read
  end
  end
end

class RubyCsv < ActsAsCSV
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
