class Article < ApplicationRecord
  validates :title_rus, presence: true, length: { minimum: 5 }
  validates :country, presence: true, length: { minimum: 2 }
  validates :category, presence: true, length: { minimum: 3 }
  validates :src_url, presence: true
  validates :keywords, presence: true
  validates :text, presence: true, length: { minimum: 5 }
end
