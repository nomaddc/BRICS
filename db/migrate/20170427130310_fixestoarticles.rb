class Fixestoarticles < ActiveRecord::Migration[5.0]

  def change

    ActiveRecord::Base.transaction do
      Article.all.each do |article|
        Article.where(:country => "Russia").update_all(:country => "Russian Federation")
        Article.where(:country => "Китай").update_all(:country => "China")
        Article.where(:category => "Внутреняя политика").update_all(:category => "Внутренняя политика")
        Article.where(:category => "economics").update_all(:category => "investment and finance")
        Article.where(:category => "domestic policy").update_all(:category => "political events")
      end
    end
  end

end
