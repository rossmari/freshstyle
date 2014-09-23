class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :is_admin, null: false, default: false

      t.timestamps
    end
  end
end
