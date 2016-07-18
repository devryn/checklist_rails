class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :list, foreign_key: true
      t.boolean :completed, default: false, null: false
      t.string :body, null: false, limit: 300
      t.integer :position, null: false

      t.timestamps
    end
  end
end
