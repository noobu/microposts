class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :text
    add_column :users, :area, :text
  end
end
