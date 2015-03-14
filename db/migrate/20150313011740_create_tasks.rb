class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.string :title
      t.datetime :expires_at
      t.boolean :completed

      t.timestamps null: false
    end
    add_foreign_key :tasks, :users
  end
end
