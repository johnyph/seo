class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :keyword, index: true
      t.integer :ad_top
      t.integer :ad_right
      t.integer :ad_total
      t.integer :simple_results
      t.integer :total_links
      t.string :total_search
      t.text :code

      t.timestamps null: false
    end
    add_foreign_key :results, :keywords
  end
end
