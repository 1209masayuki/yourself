class AddCardToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :card, foreign_key: true
  end
end
