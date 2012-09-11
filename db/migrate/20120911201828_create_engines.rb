class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :query

      t.timestamps
    end
  end
end
