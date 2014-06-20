class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :user
      t.string :user_name
      t.integer :int8, :limit => 8

      t.timestamps
    end
  end
end
