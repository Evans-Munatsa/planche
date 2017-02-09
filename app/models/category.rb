class Category < ApplicationRecord
	validates_presence_of :name
	belongs_to :user, :foreign_key => "user_id"
	has_many :posts
end
