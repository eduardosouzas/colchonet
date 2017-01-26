class AddUserIdToRooms < ActiveRecord::Migration
  def change
    add_reference :rooms, :user, index: true, foreign_key: true
    add_column :rooms, :invoke, :string
    add_column :rooms, :active_record, :string
  end
end
