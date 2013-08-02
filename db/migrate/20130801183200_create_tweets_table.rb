require_relative '../../app/models/legislator'

class CreateTweetsTable < ActiveRecord::Migration
  def up
    create_table :tweets do |t|
      t.belongs_to :legislator
      t.string :identifier
      t.string :text
    end
  end

  def down
    drop_table :tweets
  end
end
