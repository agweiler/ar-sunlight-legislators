require_relative 'app/models/legislator'
#1. Given state, list House Reps
# SELECT legislators WHERE state matches state_input and WHERE title is Rep
# PUTS each of these filtered legislators in a list


class Test

  def self.list_state_reps(state)
    legislator = Legislator.select(:first_name, :last_name, :party).where("state =  ? AND title = ? ", state, "Rep")
    puts 'House Representatives:'
    puts '------------------------'

    legislator.each { |column| puts "#{column.first_name} #{column.last_name} #{column.party}" }
    puts '------------------------'
  end

  #2. Given state, list Senators
  # SELECT legislators WHERE state matches state_input and WHERE title is Sen
  # PUTS each of these filtered legislators in a list

  def self.list_state_senators(state)
    legislator = Legislator.select(:first_name, :last_name, :party).where("state = ? AND title = ? ", state, "Sen")
    puts 'Senators:'
    puts '------------------------'

    legislator.each { |column| puts "#{column.first_name} #{column.last_name} #{column.party}" }
    puts '------------------------'
  end

  #3. Given party, list Senators
  # SELECT legislators WHERE party matches party_input and WHERE title is Sen
  # PUTS each of these filtered legislators in a list

  def self.list_senators_by_party(party)
    legislator = Legislator.select(:first_name, :last_name, :party).where("party = ? AND title = ?", party, "Sen")
    puts 'Senators:'
    puts '------------------------'

    legislator.each { |column| puts "#{column.first_name} #{column.last_name} #{column.party}" }

  end

  #4. Given party, list House Reps
  # SELECT legislators WHERE party matches party_input and WHERE title is Rep
  # PUTS each of these filtered legilators in a list

  def self.list_reps_by_party(party)
    legislator = Legislator.select(:first_name, :last_name, :party).where("party = ? AND title = ?", party,'Rep')
    puts 'House Representatives:'
    puts '------------------------'

    legislator.each { |column| puts "#{column.first_name} #{column.last_name} #{column.party}" }
    puts '------------------------'
  end

  #5. Given legislator, obtain attributes
  # SELECT relevant attributes of legislators WHERE legislator matches legislator input
  # PUTS these attributes

  def self.get_attribute_info(legislator_id)
    legislator = Legislator.select(:first_name, :last_name, :phone, :fax, :website, :email, :party, :gender, :birthdate, :twitter_id).where(" legislator_id = ?", legislator_id )
    puts 'Legislator Details:'
    puts '------------------------'

    legislator.each { |column| puts "{column.first_name} {column.last_name} {column.phone} {column.fax} {column.website} {column.email} {column.party} {column.gender} {column.birthdate} {column.twitter_id}" }
    puts '------------------------'
  end

  #6. Given legislator, determine whether they are in office
  # SELECT relevant attribute (i.e. in office or not in office) of legislators
  # PUTS in office or not

  def self.in_office?(legislator_id)
    legislator = Legislator.select(:first_name, :last_name, :party, :in_office)
    puts 'Service Status'
    puts '------------------------'
    puts '1 = currently in office'
    puts '0 = currently not in office'

    legislator.each { |column| puts "{column.first_name} {column.last_name} {column.phone} {column.in_office}"}
  end
end









