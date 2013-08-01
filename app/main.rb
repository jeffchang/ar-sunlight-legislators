require_relative 'models/legislator'

# puts "Senators:"
# Legislator.select("firstname, middlename, lastname, name_suffix, party").where('state = ? 
#                   and title = ?', 'CA', 'Sen').group("lastname").each do |legislator|
#   puts "#{legislator.firstname} #{legislator.middlename} #{legislator.lastname} #{legislator.name_suffix} (#{legislator.party})".gsub("  ", " ")
# end
# puts
# puts "Representatives:"
# Legislator.select("firstname, middlename, lastname, name_suffix, party").where('state = ? 
#                         and title = ?', 'CA', 'Rep').group("lastname").each do |legislator|
#   puts "#{legislator.firstname} #{legislator.middlename} #{legislator.lastname} #{legislator.name_suffix} (#{legislator.party})".gsub("  ", " ")
# end

male_sen_count = Legislator.where('gender = ? and title = ? and in_office = ?', 'M', 'Sen', 1).count
total_sen_count = Legislator.where('title = ? and in_office = ?', 'Sen', 1).count

puts "Male Senators: #{male_sen_count} (#{male_sen_count * 100/total_sen_count}%)"

male_rep_count = Legislator.where('gender = ? and title = ? and in_office = ?', 'M', 'Rep', 1).count
total_rep_count = Legislator.where('title = ? and in_office = ?', 'Rep', 1).count

puts "Male Representatives: #{male_rep_count} (#{male_rep_count * 100/total_rep_count}%)"
