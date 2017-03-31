class FillLangInArticles < ActiveRecord::Migration[5.0]
  def change
    ActiveRecord::Base.transaction do
      Article.all.each do |article|
        article.lang = "rus"
        article.lang = "eng" unless article.title.blank?
        article.save
      end
    end
  end
end
