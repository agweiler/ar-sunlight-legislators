require 'csv'
require_relative '../app/models/legislator.rb'


class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    header = ['first_name', 'last_name', 'title', 'state', 'phone', 'fax', 'website', 'email', 'in_office', 'party', 'gender', 'birthday', 'twitter_id']

    csv.each do |row|
      #Basically, need to create a hash whereby the columns are the keys and rows are the values!

      row_hashed = row.to_hash
      attributes_hash = Hash.new
      header.each do |column|
      attributes_hash[column] = row_hashed[column]
      #row.each do |field, value|
      #row_hash = Hash.new { |column, row| row_hash[headers] }
      #row_hash = row.to_hash
      #column_hash = headers.to_hash
        # TODO: begin
        #p field, value
        # TODO: end
      end
      Legislator.create(attributes_hash)
    end
  end
end




# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
