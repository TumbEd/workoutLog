class Workout < ApplicationRecord
	has_many :exercises, dependent: :destroy
	validates :workout, presence: true 
	validates :mood, presence: true
	validates :length, presence: true
end