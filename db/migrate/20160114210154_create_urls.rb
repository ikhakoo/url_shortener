class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :target_url
      t.string :short_url

      t.timestamps null: false
    end
  end
end
