class AddCreatorIdToEvents < ActiveRecord::Migration[5.0]
  def change
    #add_reference :events, :creator, foreign_key: true, index: true, references: :users
    add_foreign_key :events, :users, column: :creator_id
  end
end
