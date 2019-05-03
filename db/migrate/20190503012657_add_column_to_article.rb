class AddColumnToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :user_id, :integer, null: false, index: true, foreign_key: true
  end
end
