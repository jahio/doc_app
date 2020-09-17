class CreateVideoGames < ActiveRecord::Migration[6.0]
  def change
    create_table :video_games do |t|
      t.string        :title
      t.string        :url
      t.datetime      :release_date
      t.timestamps
    end

    add_index :video_games, :title, unique: true
    add_index :video_games, :release_date
  end
end
