class AddHeaderToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :header, :string
  end
end
