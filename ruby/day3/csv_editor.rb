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
      @csv_rows = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        csv_contents = row.chomp.split(',')
        @csv_rows << CsvRow.new(@headers, csv_contents)
      end
    end
    attr_accessor :headers, :csv_rows
    def initialize
      read
    end
    def each &block
      @csv_rows.each &block
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

class CsvRow
    attr_accessor :header_row, :content_row
  
    def initialize header_row, content_row
      @header_row = header_row
      @content_row = content_row
    end

    def method_missing name, * args
      content_index = @header_row.index(name.to_s)
      return @content_row[content_index]
    end
end

m = RubyCsv.new
m.each {|row| puts row.one}
