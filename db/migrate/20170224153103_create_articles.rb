class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.date :date
      t.string :src_name
      t.string :src_url
      t.string :country
      t.string :author
      t.string :keywords
      t.text :text

      t.timestamps
    end
  end
end
