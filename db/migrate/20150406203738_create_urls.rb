class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :link
      t.references :url_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :urls, :url_types
  end
end
