class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :invitee, foreign_key: true, references: :users
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
