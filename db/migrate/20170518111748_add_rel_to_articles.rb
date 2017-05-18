class AddRelToArticles < ActiveRecord::Migration[5.0]

  def change

    add_column :articles, :rel, :decimal
  end

end
