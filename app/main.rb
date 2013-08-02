require_relative 'models/legislator'
require_relative 'models/representative'
require_relative 'models/senator'


def legislators_by_state(state)
  puts "Senators:"
  Legislator.select("firstname, middlename, lastname, name_suffix, party").where("state = ? 
                    and title = ?", "#{state}", "Sen").order("lastname").each do |legislator|
    puts "#{legislator.firstname} #{legislator.middlename} #{legislator.lastname} #{legislator.name_suffix} (#{legislator.party})".gsub("  ", " ")
  end
  puts
  puts "Representatives:"
  Legislator.select("firstname, middlename, lastname, name_suffix, party").where("state = ? 
                          and title = ?", "#{state}", "Rep").order("lastname").each do |legislator|
    puts "#{legislator.firstname} #{legislator.middlename} #{legislator.lastname} #{legislator.name_suffix} (#{legislator.party})".gsub("  ", " ")
  end
  puts
end

def gender_count(gender)
  gender_sen_count = Legislator.where('gender = ? and title = ? and in_office = ?', "#{gender}", "Sen", 1).count
  total_sen_count = Legislator.where('title = ? and in_office = ?', "Sen", 1).count

  puts "#{gender == 'M' ? "Male" : "Female"} Senators: #{gender_sen_count} (#{gender_sen_count * 100/total_sen_count}%)"

  gender_rep_count = Legislator.where('gender = ? and title = ? and in_office = ?', "#{gender}", "Rep", 1).count
  total_rep_count = Legislator.where('title = ? and in_office = ?', "Rep", 1).count

  puts "#{gender == 'M' ? "Male" : "Female"} Representatives: #{gender_rep_count} (#{gender_rep_count * 100/total_rep_count}%)"
  puts
end

def states_by_num
  rep_result = Legislator.where('title = ? and in_office = ?', 'Rep', 1).group('title').group('state').count
  sen_result = Legislator.where('title = ? and in_office = ?', 'Sen', 1).group('title').group('state').count

  sen_result, rep_result = [sen_result, rep_result].map { |result| result.sort_by { |key, value| value }.reverse.map { |element| element.flatten.drop(1) } }

  rep_result.each do |sen_state, rep_num|
    sen_result.each do |rep_state, sen_num|
      puts "#{sen_state}: #{sen_num} Senators, #{rep_num} Representative(s)" if sen_state == rep_state
    end
  end
end

def total_num
  puts "Senators: #{Legislator.where('title = ?', 'Sen').count}"
  puts "Representatives: #{Legislator.where('title = ?', 'Rep').count}"
end

def delete_inactive
  inactive = Legislator.where('in_office = ?', 0)
  inactive.each { |record| record.destroy }
end


legislators_by_state('AL')
gender_count('F')
states_by_num
total_num
delete_inactive
