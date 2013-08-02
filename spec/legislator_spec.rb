require 'rspec'
require_relative '../app/models/legislator'
require_relative '../app/models/representative'
require_relative '../app/models/senator'

# describe Legislator, "#phone" do

#   before(:each) do
#     @legislator = Legislator.all.sample
#   end

#   it "shouldn't accept invalid phone numbers" do
#     @legislator.assign_attributes(:phone => '123-456-1234')
#     @legislator.should_not_be_valid
#   end

# end
  
describe Senator do

  before(:each) do
    @senator = Senator.new({
      firstname: "Leslie",
      lastname: "Lai"
      })
  end

  it "should create a senator in the Legislator table" do
    @senator.save
    Legislator.where('firstname = ? and lastname = ?', 'Leslie', 'Lai').first.class.should == Senator
  end

end
