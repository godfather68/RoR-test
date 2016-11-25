class Article < ApplicationRecord
	has_many :comments
	validates :title, presence: true,
					  length: { minimum: 5 }
	belongs_to :user
	belongs_to :category
end
