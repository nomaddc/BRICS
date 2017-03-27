class AddIsactiveToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :is_active, :boolean, :null => false, :default => true
  end
end
