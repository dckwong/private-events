class Event < ApplicationRecord
	belongs_to :user, foreign_key: 'creator_id'
	default_scope { order(date: :asc) }
end
