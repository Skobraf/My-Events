class CreateInvitaions < ActiveRecord::Migration[5.2]
  def change
    create_table :invitaions do |t|
      t.references :event, foreign_key: true
      t.integer :invitation_sender
      t.integer :invited_user

      t.timestamps
    end
  end
end
