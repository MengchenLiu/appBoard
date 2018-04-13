class CreateUserApps < ActiveRecord::Migration[5.1]
  def change
    create_table :user_apps do |t|
      t.integer :app_id
      t.integer :user_id
      t.integer :position

      t.timestamps
    end
  end
end
