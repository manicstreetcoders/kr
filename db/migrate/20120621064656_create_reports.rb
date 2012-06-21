class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
    add_index :reports, :user_id
    add_index :reports, :title
  end
end
