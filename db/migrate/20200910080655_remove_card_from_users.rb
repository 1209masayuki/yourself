class RemoveCardFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :card, null: false, foreign_key: true
  end
end
