class AddLangToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :lang, :string
  end
end
