class CreateMyvideos < ActiveRecord::Migration[5.1]
  def change
    create_table :myvideos do |t|
      t.string :youtube_url
      t.string :title
      t.string :string
      t.text :explanation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
