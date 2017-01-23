class User < ApplicationRecord
	has_secure_password
	has_many :events, foreign_key: 'creator_id'
	has_many :invitations, foreign_key: 'invitee_id'
	has_many :invited_events, class_name: 'Event', through: :invitations, source: :event
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255}, 
		format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
	validates :password, length: { minimum: 6}, presence: true

	def upcoming_events
		invited_events.upcoming
	end

	def previous_events
		invited_events.previous
	end
end
