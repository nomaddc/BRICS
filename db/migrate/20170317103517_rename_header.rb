class RenameHeader < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :category, :string
    remove_column :articles, :header, :string
  end
end
