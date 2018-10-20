class Event < ApplicationRecord
	belongs_to :creator_id, class_name: 'User', foreign_key: 'creator_id'

end
