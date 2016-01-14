class CreateTotalClicks < ActiveRecord::Migration
  def change
    create_table :total_clicks do |t|
      t.integer :url_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
