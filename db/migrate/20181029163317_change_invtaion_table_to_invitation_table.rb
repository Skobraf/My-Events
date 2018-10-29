class ChangeInvtaionTableToInvitationTable < ActiveRecord::Migration[5.2]
  def change
  	rename_table :invitaions, :invitations
  end
end
