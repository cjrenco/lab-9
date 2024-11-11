class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :completed
      t.datetime :completed_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
