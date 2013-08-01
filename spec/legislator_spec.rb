require 'rspec'
require_relative '../app/models/legislator'

describe Legislator, "#phone" do

  before(:each) do
    @legislator = Legislator.all.sample
  end

  it "shouldn't accept invalid phone numbers" do
    @legislator.assign_attributes(:phone => '123-456-1234')
    @legislator.should_not_be_valid
  end
  
end
