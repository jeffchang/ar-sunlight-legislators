require 'csv'
require_relative '../app/models/legislator.rb'
require_relative '../app/models/senator.rb'
require_relative '../app/models/representative.rb'

class SunlightLegislatorsImporter
  def self.import
    CSV.foreach('db/data/legislators.csv', {:headers => true, :header_converters => :symbol}) do |row|
      row = row.to_hash
      row.delete_if { |key, value| [:nickname, :district, :congress_office, :bioguide_id, :votesmart_id, 
        :fec_id, :govtrack_id, :crp_id, :congresspedia_url, :youtube_url, :facebook_id, :official_rss, 
        :senate_class].include?(key) }
      row[:phone] = row[:phone].gsub(/\D/, "")
      Senator.create!(row) if row[:title] == "Sen"
      Representative.create!(row) if row[:title] == "Rep"
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
