class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer       :user_id, index: true, foreign_key: true, null: false
      t.integer       :article_id, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
