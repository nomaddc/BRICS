class RemoveSrcNameFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :src_name, :string
  end
end
