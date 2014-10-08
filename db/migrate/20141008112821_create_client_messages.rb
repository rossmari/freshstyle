class CreateClientMessages < ActiveRecord::Migration
  def change
    create_table :client_messages do |t|
      t.string :name
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
