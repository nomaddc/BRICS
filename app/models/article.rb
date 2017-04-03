class Article < ApplicationRecord
  include Filterable
  validates :title_rus, presence: true, length: { minimum: 5 }
  validates :country, presence: true, length: { minimum: 2 }
  validates :category, presence: true
  validates :src_url, presence: true
  validates :keywords, presence: true
  validates :text, presence: true, length: { minimum: 5 }
  validates :date, presence: true

  scope :country, -> (country) { where country: country }
  scope :category, -> (category) { where category: category }
  scope :src_url, -> (src_url) { where src_url: src_url }
  scope :date, -> (date) { where date: date }
  scope :lang, -> (lang) { where lang: lang }
  scope :keywords, -> (keywords) { where keywords: keywords }
  # scope :title_rus, -> (title_rus) { where('title_rus like ?', '#{title_rus}%')}
  # scope :title, -> (title) { where('title like ?', '#{title}%')}
end
