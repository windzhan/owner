class CreateAdminUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users do |t|
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
