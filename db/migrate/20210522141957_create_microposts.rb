class CreateMicroposts < ActiveRecord::Migration[6.1]
  def change
    create_table :microposts do |t|
      t.string :name
      t.text :content
      t.string :youtube_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :microposts, %i[user_id created_at]
  end
end
