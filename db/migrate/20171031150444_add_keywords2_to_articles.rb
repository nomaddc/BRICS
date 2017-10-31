class AddKeywords2ToArticles < ActiveRecord::Migration[5.0]

  def change

    add_column :articles, :keywords2, :string
  end

end
