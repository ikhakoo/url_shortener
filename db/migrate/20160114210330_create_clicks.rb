class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :url_id
      t.string :referral_url
      t.string :referral_ip

      t.timestamps null: false
    end
  end
end
