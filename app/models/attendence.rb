class Attendence < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create :delete_invitation

  def delete_invitation
  	@invitation = Invitation.find_by(event: self.event_id, invited_user: self.user_id)
  	@ivitation.destroy
  end
end
