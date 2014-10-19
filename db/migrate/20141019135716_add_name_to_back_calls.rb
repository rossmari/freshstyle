class AddNameToBackCalls < ActiveRecord::Migration
  def change
    add_column :back_calls, :name, :string
  end
end
