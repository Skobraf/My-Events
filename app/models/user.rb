class User < ApplicationRecord
	has_many :events, class_name: 'Event', foreign_key: 'creator_id'
	has_many :attendences
	has_many :event_as_attendee, through: :attendences, source: "event"
	has_many :invitations, class_name: 'Invitation', foreign_key: 'invitation_sender'
	has_many :invitations_received, class_name: 'Invitation', foreign_key: 'invited_user'

	before_save { self.email = email.downcase }
	validates :name, presence: true,
				 length: {minimum: 3, maximum: 25},
				 format: { without: /\s/ }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
end
