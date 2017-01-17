class User < ApplicationRecord
	has_secure_password
	has_many :events, foreign_key: 'creator_id'
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255}, 
		format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
	validates :password, length: { minimum: 6}, presence: true


end
