class AddIconToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :icon, :string
  end
end
