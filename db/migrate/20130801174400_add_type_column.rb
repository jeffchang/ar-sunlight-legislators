require_relative '../../app/models/legislator'

class AddTypeColumn < ActiveRecord::Migration
  def up
    add_column :legislators, :type, :type
  end

  def down
    remove_column :legislators, :type
  end
end
