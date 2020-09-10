class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.integer :price, null: false, index: true
      t.timestamps
    end
  end
end
