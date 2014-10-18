class AddStateToClientMessage < ActiveRecord::Migration

  def up
    add_column :client_messages, :new, :boolean, default: false, null: false
  end

  def down
    remove_column :client_messages, :new
  end

end
