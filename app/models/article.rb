class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_rich_text :body
end
