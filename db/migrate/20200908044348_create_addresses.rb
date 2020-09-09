class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false, default: ""
      t.integer :prefecture_id, null: false
      t.string :city, null: false, default: ""
      t.text :addresses, null: false
      t.string :building, default: ""
      t.references :user
      t.timestamps
    end
  end
end
