class Event < ApplicationRecord
	belongs_to :creator, class_name: 'User'
	has_many :invitations
	has_many :invitees, through: :invitations, class_name: 'User'
	validates :location, presence: true
	validates :date, presence: true
	validates :name, presence: true
	default_scope { order(date: :asc) }
	scope :upcoming, -> { where("date > ?", DateTime.now)}
	scope :previous, -> { where("date < ?", DateTime.now)}
end
