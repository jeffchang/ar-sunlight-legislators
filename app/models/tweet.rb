require_relative '../../db/config'
require_relative 'legislator'

class Tweet < ActiveRecord::Base

  belongs_to :legislator

end
