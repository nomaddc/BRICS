class Article < ApplicationRecord
  validates :title_rus, presence: true, length: { minimum: 5 }
  validates :country, presence: true, length: { minimum: 5 }
  validates :src_name, presence: true, length: { minimum: 5 }
  validates :src_url, presence: true
  validates :keywords, presence: true
  validates :text, presence: true, length: { minimum: 5 }
end
