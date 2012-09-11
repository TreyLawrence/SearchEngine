class CreateWordsPages < ActiveRecord::Migration
  def change
    create_table :words_pages do |t|
      t.integer :page_id
      t.integer :word_id

      t.timestamps
    end
  end
end
