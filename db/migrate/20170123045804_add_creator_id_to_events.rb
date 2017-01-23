class AddCreatorIdToEvents < ActiveRecord::Migration[5.0]
	def change
		#add_reference :events, :creator, index: true, foreign_key: true
		add_column :events, :creator_id, :integer
		add_index :events, :creator_id
	end
end
