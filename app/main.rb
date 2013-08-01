require_relative 'models/legislator'

puts "Senators:"
Legislator.select("firstname, middlename, lastname, name_suffix, party").where('state = ? 
                  and title = ?', 'CA', 'Sen').group("lastname").each do |legislator|
  puts "#{legislator.firstname} #{legislator.middlename} #{legislator.lastname} #{legislator.name_suffix} (#{legislator.party})".gsub("  ", " ")
end
puts
puts "Representatives:"
Legislator.select("firstname, middlename, lastname, name_suffix, party").where('state = ? 
                        and title = ?', 'CA', 'Rep').group("lastname").each do |legislator|
  puts "#{legislator.firstname} #{legislator.middlename} #{legislator.lastname} #{legislator.name_suffix} (#{legislator.party})".gsub("  ", " ")
end
