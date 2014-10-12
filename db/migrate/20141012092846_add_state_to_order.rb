class AddStateToOrder < ActiveRecord::Migration

  def up
    add_column :orders, :state, :string, default: 'new'
  end

  def down
    remove_column :orders, :state
  end

end
