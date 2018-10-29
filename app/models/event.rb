class Event < ApplicationRecord

	belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
	has_many :attendences
	has_many :attendees, through: :attendences, source: "user"
	has_many :invitions

	scope :past, -> { where("date < ? ", DateTime.now) }
	scope :future, -> { where("date > ? ", DateTime.now) }



end
