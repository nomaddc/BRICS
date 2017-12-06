class FixcatInArticles < ActiveRecord::Migration[5.0]

  def change

    ActiveRecord::Base.transaction do
      Article.all.each do |article|
        Article.where(:category => "экономика").update_all(:category => "2 экономика")
        Article.where(:category => "внутренняя политика").update_all(:category => "3 внутренняя политика")
        Article.where(:category => "международные отношения").update_all(:category => "1 международные отношения")
        Article.where(:category => "мир труда").update_all(:category => "4 мир труда")
        Article.where(:category => "документы").update_all(:category => "5 документы")
        Article.where(:category => "другие материалы").update_all(:category => "6 другие материалы")
        Article.where(:category => "international relations").update_all(:category => "1 international relations")
        Article.where(:category => "investment and finance").update_all(:category => "2 investment and finance")
	Article.where(:category => "political events").update_all(:category => "3 political events")
	Article.where(:category => "world of work").update_all(:category => "4 world of work")
	Article.where(:category => "documents").update_all(:category => "5 documents")
	Article.where(:category => "other materials").update_all(:category => "6 other materials")
      end
    end
  end

end
