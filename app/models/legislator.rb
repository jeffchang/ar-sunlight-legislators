require_relative '../../db/config'
require_relative 'tweet'

class Legislator < ActiveRecord::Base

  has_many :tweets

end
