class AddKanalastnameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :kanalastname, :string
  end
end
