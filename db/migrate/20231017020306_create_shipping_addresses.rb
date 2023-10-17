class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :post_code,   null: false
      t.integer    :shipping_area,    null: false
      t.string     :city, null: false
      t.string     :street, null: false
      t.string     :building
      t.string     :telephone, null: false
      t.references :purchase,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
