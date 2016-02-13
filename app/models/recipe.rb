class Recipe < ActiveRecord::Base
	has_many :comments
	belongs_to :user

	validates :title, length: {minimum: 3}
	validates :ingredients, length: {minimum: 3}
	validates :directions, length: {minimum: 3}
end
