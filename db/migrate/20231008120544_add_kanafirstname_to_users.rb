class AddKanafirstnameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :kanafirstname, :string
  end
end
