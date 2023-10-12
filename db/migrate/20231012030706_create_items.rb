class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user
      t.string :item
      t.text  :explanation 
      t.integer :category_id 
      t.integer :status_id 
      t.integer :delivery_charge_id
      t.integer :shipping_area_id
      t.integer :shipping_day_id
      t.integer :price 
      t.timestamps
    end
  end
end
