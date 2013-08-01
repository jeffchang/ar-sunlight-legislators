require_relative '../../app/models/legislator'

class CreateLegislators < ActiveRecord::Migration
  def up
    create_table :legislators do |t|
      t.string :title
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :name_suffix
      t.string :party
      t.string :state
      t.string :in_office
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :birthdate
      t.string :twitter_id
    end
  end

  def down
    drop_table :legislators
  end
end
