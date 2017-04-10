class FixcountrynamesinArticles < ActiveRecord::Migration[5.0]
  def change
    ActiveRecord::Base.transaction do
      Article.all.each do |article|
        Article.where(:country => "Россия").update_all(:country => "Russia")
        Article.where(:country => "Украина").update_all(:country => "Ukraine")
        Article.where(:country => "Китай").update_all(:country => "China")
        Article.where(:country => "Великобритания").update_all(:country => "United Kingdom")
        Article.where(:country => "Казахстан").update_all(:country => "Kazakhstan")
        Article.where(:country => "Бразилия").update_all(:country => "Brazil")
        Article.where(:country => "US").update_all(:country => "United States")
        Article.where(:country => "USA").update_all(:country => "United States")
      end
    end
  end
end
