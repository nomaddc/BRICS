class Fixcapitalisation < ActiveRecord::Migration[5.0]

  def change

    ActiveRecord::Base.transaction do
      Article.all.each do |article|
        Article.where(:category => "Международные отношения").update_all(:category => "международные отношения")
        Article.where(:category => "Мир Труда").update_all(:category => "мир труда")
        Article.where(:category => "Внутренняя политика").update_all(:category => "внутренняя политика")
        Article.where(:category => "Экономика").update_all(:category => "экономика")
        Article.where(:category => "World of Work").update_all(:category => "world of work")
        Article.where(:category => "International relations").update_all(:category => "international relations")
        Article.where(:category => "Documents").update_all(:category => "documents")
      end
    end
  end
end
