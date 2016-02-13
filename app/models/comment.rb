class Comment < ActiveRecord::Base
	belongs_to :recipe

	validates :title, presence:true
	validates :recipe_id, presence:true
end
