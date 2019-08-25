class Book < ApplicationRecord

	belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
	validates :title, length: { maximum: 200 }, presence: true
end
