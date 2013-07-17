class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string  :long_url, NOT NULL
      t.string  :short_url, NOT NULL
    end
  end
end
